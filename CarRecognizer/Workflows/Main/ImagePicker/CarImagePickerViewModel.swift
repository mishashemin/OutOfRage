//
//  File.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 10.10.2020.
//

import Foundation
import ImagePicker
import RxSwift
import IHProgressHUD

class CarImagePickerViewModel: NSObject, ImagePickerDelegate {
    
    typealias Context = IRecognizerServiceContext
    
    // MARK: - Properties
    private var context: Context
        
    private let disposeBag = DisposeBag()
    
    var onRecognizeEvent: (([CarModel]) -> Void)?
    
    init(context: Context) {
        self.context = context
        super.init()
        self.setupRx()
    }
    
    deinit {
        #if DEBUG
        print("💭 deinit CarImagePickerViewModel")
        #endif
    }
    
    func setupRx() {
        
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard let image = images.first else {
            return
        }
        IHProgressHUD.show()
        context.recognizerService.recognize(image: image).subscribe({ [weak self] event in
            IHProgressHUD.dismiss()
            switch event {
            case .success(let recognizedCars):
                imagePicker.dismiss(animated: true, completion: { [weak self] in
                    var carModels: [CarModel] = []
                    carModels.append(CarModel(model: "модель", brand: "брэнд", price: 1000000, countryOfOrigin: "Хз", generation: "генерация", bodyType: "", carType: "", iconUrl: "https://motor.ru/thumb/0x1200/filters:quality(75):no_upscale()/imgs/2018/01/03/21/1434673/2030696e747f3dea82f93f0484ae03faf530c1e2.jpg"))
                    self?.onRecognizeEvent?(carModels)
                })
            case .error(let error):
                if let error = error as? ICarRecognizerLocalizedError {
                    let alert = UIAlertController(title: error.title, message: error.described, preferredStyle: .alert)
                    let doneAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(doneAction)
                    imagePicker.present(alert, animated: true, completion: nil)
                }
                return
            }
        }).disposed(by: disposeBag)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: { [weak self] in
            var carModels: [CarModel] = []
            carModels.append(CarModel(model: "модель", brand: "брэнд", price: 1000000, countryOfOrigin: "Хз", generation: "генерация", bodyType: "", carType: "", iconUrl: "https://motor.ru/thumb/0x1200/filters:quality(75):no_upscale()/imgs/2018/01/03/21/1434673/2030696e747f3dea82f93f0484ae03faf530c1e2.jpg"))
            carModels.append(CarModel(model: "модель", brand: "брэнд", price: 1000000, countryOfOrigin: "Хз", generation: "генерация", bodyType: "", carType: "", iconUrl: "https://motor.ru/thumb/0x1200/filters:quality(75):no_upscale()/imgs/2018/01/03/21/1434673/2030696e747f3dea82f93f0484ae03faf530c1e2.jpg"))
            self?.onRecognizeEvent?(carModels)
        })
    }
}
