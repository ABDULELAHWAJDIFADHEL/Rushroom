//
//  AppConfig.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import Foundation

class AppConfig: NSObject {
    
    static let defautQ = DispatchQueue.global(qos: .default)
    static let defautMainQ = DispatchQueue.main
    static let backgrountQ = DispatchQueue.global(qos: .background)
    static let priorityQ = DispatchQueue.global(qos: .userInteractive)
    static var debugDate = Date()
    
    static func getServiceHostURL() -> String {
        let bundle = MAIN_BUNDLE.object(forInfoDictionaryKey : "BASE_URL")
        return bundle as! String
    }
    
    static func getAPPName() -> String {
        let bundle = MAIN_BUNDLE.object(forInfoDictionaryKey : "APP_NAME")
        return bundle as! String
    }
    
    static func getAPPConstantFileName() -> String {
        let bundle = MAIN_BUNDLE.object(forInfoDictionaryKey : "STRING_FILE")
        return bundle as! String
    }
    
    static func imageBaseURL() -> String {
        return "https://d2bqd8bqz9lgia.cloudfront.net/"
    }
    
        // Already used in App Url swift File
    static let baseURL  = getServiceHostURL()
    
    struct URL {
        
        //USER
        static let login = baseURL + "user/login"
    }
    
}
