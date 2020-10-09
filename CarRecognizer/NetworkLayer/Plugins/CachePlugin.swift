//
//  File.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 10.10.2020.
//

import Moya

public protocol ICachePolicy {
  var cachePolicy: URLRequest.CachePolicy { get }
}

open class CachePlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let target = target as? ICachePolicy {
            var cacheRequest = request
            cacheRequest.cachePolicy = target.cachePolicy
            return cacheRequest
        }
        return request
    }
}
