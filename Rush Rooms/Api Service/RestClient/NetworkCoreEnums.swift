//
//  ConstantTexts.swift
//  Bayin
//
//  Created by Call Soft on 30/08/22.
//


import Foundation

typealias Parameters = [String: Any]
typealias QueryParameters = [String: Any]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    case requestPlain
    case emptyRequestParameters([String])
    case requestParameters(Parameters)
    case requestComboParameters(_ bodyPram:Parameters, _ queryParam:QueryParameters)
    case requestMultiPartParameters(_ bodyPram:Parameters, _ queryParam:QueryParameters,data:Data,name:String,fileName:String,mimeType:String)
    case requestArrayParameters([Parameters])
    case requestParametersWith(data:Data)
}

enum ParametersEncoding {
    case url
    case json
    case urlAndJson
    case multipartFormData
}

enum NetworkResponse<T> {
  case success(T)
  case failure(NetworkError)
}

enum NetworkResponsePlain{
    case success(Any)
    case failure(NetworkError)
}

enum AppError:String {
    case SUSPENDED_ACCOUNT = "SUSPENDED_ACCOUNT"
}

enum NetworkError : Error {
    case noInternet
    case unknown
    case appError(error: AppError)
    case noJsonData
    case MsgError(error:String)
    case OtherError(error:Error)
    case TimeOut
    
    var localizedDescription: String {
        switch self {
        case .noInternet:
            return "No Internet"
        case .unknown:
            return "Unknown Error"
        case .noJsonData:
            return "No json data"
        case .appError(error: let error):
            switch error {
            case .SUSPENDED_ACCOUNT:
                    return "Your account is suspended by admin."
            }
        case .MsgError(error: let error):
            if error == "Stream active already" {
                return "Stream is already running in another device"
            }
            if error == "Max zone limit reached" {
                return "User can add 4 geofence only!"
            }
            return error
        case .OtherError(error: let error):
            return error.localizedDescription
        case .TimeOut:
            return "Timeout"
        }
    }
}
