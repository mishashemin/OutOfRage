//
//  File.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 10.10.2020.
//

import Moya

public protocol ICarRecognizerTokenManager {
    /**
     Returns the access token
     */
    func getAccessToken() -> String?
}
