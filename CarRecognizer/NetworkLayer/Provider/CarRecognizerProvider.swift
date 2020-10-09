//
//  File.swift
//  OutOfRage
//
//  Created by Mikhail Shemin on 08.10.2020.
//

import Foundation
import Moya
import Alamofire
import RxSwift

open class CarRecognizerProvider<Target>: MoyaProvider<Target> where Target: Moya.TargetType {
}

open class CarRecognizerProviderFactory<T: TargetType> {

    public func makeProvider(mockType: StubBehavior = .never, consoleLogging: Bool = false, callbackQueue: DispatchQueue? = nil, plugins: [PluginType] = [], customConfiguration: URLSessionConfiguration?, tokenManager: ICarRecognizerTokenManager?) -> MoyaProvider<T> {

        var allPlugins = plugins
        if consoleLogging {
            allPlugins += [NetworkLoggerPlugin()]
        }
        if let tokenManager = tokenManager {
            allPlugins += [CarRecognizerPlugin(tokenManager: tokenManager)]
        }
        
        let session = makeSession(customConfiguration: customConfiguration)
        
        let provider = CarRecognizerProvider<T>(stubClosure: { _ in return mockType }, callbackQueue: callbackQueue, session: session, plugins: allPlugins)
        return provider
    }

    public func makeProvider(mockType: StubBehavior = .never, consoleLogging: Bool = false, callbackQueue: DispatchQueue? = nil, plugins: [PluginType] = [], timeoutForRequest: TimeInterval = 20.0, timeoutForResponse: TimeInterval = 40.0 ,tokenManager: ICarRecognizerTokenManager?) -> MoyaProvider<T> {

        let configuration = makeConfiguration(timeoutForRequest: timeoutForRequest, timeoutForResponse: timeoutForResponse)

        return makeProvider(mockType: mockType, consoleLogging: consoleLogging, callbackQueue: callbackQueue, customConfiguration: configuration, tokenManager: tokenManager)
    }
    
    private func makeConfiguration(timeoutForRequest: TimeInterval = 20.0, timeoutForResponse: TimeInterval = 40.0) -> URLSessionConfiguration {
        let configuration: URLSessionConfiguration
        configuration = URLSessionConfiguration.default
        configuration.headers = HTTPHeaders.default
        configuration.timeoutIntervalForRequest = timeoutForRequest
        configuration.timeoutIntervalForResource = timeoutForResponse
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return configuration
    }

    private func makeSession(customConfiguration: URLSessionConfiguration?) -> Session {
        var session: Session
        if let configuration = customConfiguration {
            session = Session(configuration: configuration)
        } else {
            session = MoyaProvider<T>.defaultAlamofireSession()
        }
        return session
    }
}
