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
    
    static let VTBURLPath = "https://gw.hackathon.vtb.ru/vtb/hackathon"
    static let recognizerApiKey = "2d952b2cc508f4103e3de4d276392dfd"
    
    static let passingProbability: Float = 0.8
    static let maxImageSizeForRecognizing: Int = 500 * 1000
    
    public static let millisecondsBetweenRequests = 250
         
    static let mockRequestDelay = 0.5
}
