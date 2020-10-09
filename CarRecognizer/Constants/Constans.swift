//
//  Constans.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 09.10.2020.
//

import Foundation

public struct Constants {
    
    //Network paths
    static let devPath = "google.com"
    static let releasePath = "google.com"
    
    public static var consoleLogging: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }
    
    static let apiKey = "xyi"
    
    public static let millisecondsBetweenRequests = 250
         
    static let mockRequestDelay = 0.5
}
