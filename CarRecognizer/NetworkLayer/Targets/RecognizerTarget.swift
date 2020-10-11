//
//  File.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 10.10.2020.
//
import Moya

enum RecognizerTarget: TargetType {
    
    case recognize(image: Data)
}

extension RecognizerTarget {
    var headers: [String: String]? {
        return
            ["x-ibm-client-id": Constants.recognizerApiKey,
             "content-type": "application/json",
             "accept": "application/json"]
    }
    
    var validationType: ValidationType {
        return .none
    }
    
    var baseURL: URL {
        return URL(string: Constants.VTBURLPath)!
    }
    
    var path: String {
        switch self {
        case .recognize:
            return "/car-recognize"
        }
    }

    var method: Moya.Method {
        switch self {
        case .recognize:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .recognize(let image):
            let parameters = ["content": image.base64EncodedString()] as [String : Any]
            let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            return .requestData(postData)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
//    var sampleData: Data {
//        switch self {
//        case .recognize:
//            let mockResponse = """
//                        {
//                          "probabilities": {
//                            "BMW 3": 0.0038,
//                            "BMW 5": 0.0101,
//                            "Cadillac ESCALADE": 0.0011,
//                            "Chevrolet Tahoe": 0.0003,
//                            "Hyundai Genesis": 0.0116,
//                            "Jaguar F-PACE": 0.002,
//                            "KIA K5": 0.0063,
//                            "KIA Optima": 0.0007,
//                            "KIA Sportage": 0.0005,
//                            "Land Rover RANGE ROVER VELAR": 0.0009,
//                            "Mazda 3": 0.0013,
//                            "Mazda 6": 0.0013,
//                            "Mercedes A": 0.9585,
//                            "Toyota Camry": 0.0015
//                          }
//                        }
//                        """
//            return mockResponse.data(using: .utf8)!
//        }
//    }
}
