//
//  AppUrl.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//


import UIKit

struct Domain {
    static let development = "http://13.59.90.211:7009/api/"
    static let production = "http://54.161.129.121:7009/api/"
}

extension Domain {
    static func baseUrl() -> String {
        return Domain.production
    }
}

struct APIEndpoint {
    
    //Auth
    static let user_login                     =    "auth/user-login"
    
}


//enum HTTPHeaderField: String {
//
//    case authentication  = "Authorization"
//    case contentType     = "Content-Type"
//    case acceptType      = "Accept"
//    case acceptEncoding  = "Accept-Encoding"
//    case acceptLangauge  = "Accept-Language"
//
//    var header:String{
//        switch self {
//        case .authentication:
//            return "Authorization"
//        case .contentType:
//            return "Content-Type"
//        case .acceptType:
//            return "Accept"
//        case .acceptEncoding:
//            return "Accept-Encoding"
//        case .acceptLangauge:
//            return "Accept-Language"
//        }
//    }
//}

//enum ContentType: String {
//    case json            = "application/json"
//    case multipart       = "multipart/form-data"
//    case ENUS            = "en-us"
//}

//enum MultipartType: String {
//    case image = "Image"
//    case csv = "CSV"
//}
//
//enum MimeType: String {
//    case image = "image/png"
//    case csvText = "text/csv"
//}
//
//enum UploadType: String {
//    case avatar
//    case file
//}



