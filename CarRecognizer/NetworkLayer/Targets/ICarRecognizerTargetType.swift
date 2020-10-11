//
//  IOutOfRageTargetType.swift
//  OutOfRage
//
//  Created by Mikhail Shemin on 07.10.2020.
//

import Moya

public protocol ICarRecognizerTargetType: TargetType {
}

public extension ICarRecognizerTargetType {
    var baseURL: URL {
        #if DEV
            return URL(string: Constants.devPath)!
        #else
            return URL(string: Constants.releasePath)!
        #endif
    }

    var validationType: ValidationType {
        return .none
    }

    var sampleData: Data {
        return CarRecognizerMockResponse.emptySuccess
    }
}
