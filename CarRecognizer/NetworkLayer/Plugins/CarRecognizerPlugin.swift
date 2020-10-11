//
//  File1.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 10.10.2020.
//

import Moya

open class CarRecognizerPlugin: PluginType {
    private var tokenManager: ICarRecognizerTokenManager?
    private var request: (RequestType, TargetType)?
    private var result: Result<Moya.Response, MoyaError>?

    init(tokenManager: ICarRecognizerTokenManager?) {
        self.tokenManager = tokenManager
    }
    
    enum DataKey: String, CodingKey {
        case token = "auth_token"
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        if let accessToken = self.tokenManager?.getAccessToken() {
            request.addValue(accessToken, forHTTPHeaderField: DataKey.token.rawValue)
        }
        return request
    }

    public func willSend(_ request: RequestType, target: TargetType) {
        self.request = (request, target)
    }

    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        self.result = result
    }

    public func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        let result = result
        if let log = try? result.get() {
            let json = try? JSONSerialization.jsonObject(with: log.data, options: .allowFragments)
            print(json)
        }
        switch result {
        case .failure(let error):
            return .failure(error.carRecognizerConverter())
        case .success:
            return result
        }
    }
}
