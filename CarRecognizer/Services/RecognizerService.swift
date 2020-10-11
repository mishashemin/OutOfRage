//
//  File.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 10.10.2020.
//

import RxSwift
import RxCocoa
import Moya

protocol IRecognizerService {
    func recognize(image: UIImage) -> Single<[String]>
}

class RecognizerService: IRecognizerService {
    
    lazy private var provider = CarRecognizerProviderFactory<RecognizerTarget>().makeProvider(consoleLogging: Constants.consoleLogging, tokenManager: nil)
    lazy private var mockProvider = CarRecognizerProviderFactory<RecognizerTarget>().makeProvider(mockType: .delayed(seconds: Constants.mockRequestDelay), tokenManager: nil)
    lazy private var immediateProvider = CarRecognizerProviderFactory<RecognizerTarget>().makeProvider(mockType: .immediate, consoleLogging: true, tokenManager: nil)
    
    private func requestMap<T: Decodable>(_ input: T.Type, target: RecognizerTarget, mock: Bool = false) -> Single<T> {
        //let currentProvider = immediateProvider
        let currentProvider = mock ? mockProvider : provider
        return currentProvider.rx.request(target)
            .map(T.self)
            .catchError({ error in
                let serviceError = RecognizerServiceError.convertError(error)
                return Single.error(serviceError)
            })
    }
    
    func recognize(image: UIImage) -> Single<[String]> {
        guard let imageData = getCompressedImageData(image) else {
            return Single.error(RecognizerServiceError.init(code: .imageFormatError))
        }
        return requestMap(RecognizerResponse.self, target: .recognize(image: imageData))
            .map({ recognizedCars -> [String] in
                var passingCars: [String] = []
                for (carName, probability) in recognizedCars.probabilities where probability > Constants.passingProbability {
                    passingCars.append(carName)
                }
                if !passingCars.isEmpty {
                    return passingCars
                }
                throw RecognizerServiceError.init(code: .recognizeError)
            })
    }
    
    private func getCompressedImageData(_ image: UIImage) -> Data? {
        if let imageData = image.jpegData(compressionQuality: 1) {
            if imageData.count > Constants.maxImageSizeForRecognizing {
                let scaleFactor = CGFloat(Constants.maxImageSizeForRecognizing) / CGFloat(imageData.count)
                if let imageData = image.jpegData(compressionQuality: scaleFactor) {
                    return imageData
                }
            } else {
                return imageData
            }
        }
        return nil
    }
}
