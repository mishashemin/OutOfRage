//
//  File.swift
//  OutOfRage
//
//  Created by Mikhail Shemin on 07.10.2020.
//

import Foundation

open class CarRecognizerMockResponse {
    public class var emptySuccess: Data {
        let mockResponse = """
                    {}
                    """
        return mockResponse.data(using: .utf8)!
    }
}
