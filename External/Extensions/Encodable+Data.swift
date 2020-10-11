//
//  Encodable+Data.swift
//  OutOfRage
//
//  Created by Mikhail Shemin on 08.10.2020.
//

import Foundation
import Moya

public extension Encodable {
    func toJSONData() -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try? encoder.encode(self)
    }

    func toDictionary() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap {
            $0 as? [String: Any]
        }
    }
    
    func addLeftString(_ value: String) -> Data? {
        if let data = self.toJSONData(),
           let stringData = String(data: data, encoding: .utf8),
           let convertedData = ("\(value)\(stringData)").data(using: .utf8) {
            return convertedData
        }
        return nil
    }
    
    func postParamsTask() -> Moya.Task {
        if let data = self.addLeftString("params=") {
            return .requestData(data)
        }
        return .requestJSONEncodable(self)
    }
    
    func getParamsTask() -> Moya.Task {
        .requestParameters(parameters: self.toDictionary() ?? [:], encoding: URLEncoding.queryString)
    }
    
}
