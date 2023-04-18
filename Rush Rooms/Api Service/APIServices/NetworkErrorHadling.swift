//
//  NetworkErrorHadling.swift
//  Qubogo
//
//  Created by E01590 on 16/12/21.
//

import Foundation

func getErrorCode(json:[String:Any]) -> NetworkError {
    var error:NetworkError = .unknown
    if Array(json.keys).contains("responseMessage") {
        if let tmpCode  = json["responseMessage"] as? String {
            if let err = AppError.init(rawValue: tmpCode) {
                error = NetworkError.appError(error: err)
            } else{
                error = NetworkError.unknown
            }
        }
    }else if Array(json.keys).contains("code") {
        if ((json["code"] as? Int) != nil) {
            if let apiCode = json["code"] as? Int {
                if apiCode == 14 {
                    print("Invalid value passed for authtoken")
                }
            }
        }else if let apiCode = json["code"] as? String {
            if let err = AppError.init(rawValue: apiCode) {
                error = NetworkError.appError(error: err)
            }else{
                // code is not defined in App
                if let mess = json["message"] as? String{
                    error = NetworkError.MsgError(error: mess)
                }else if let mess = json["message"] as? [String],mess.count>0{
                    error = NetworkError.MsgError(error: mess.first!)
                }
            }
        }
    }else if Array(json.keys).contains("status"){
        if let mess = json["error"] as? String{
            error = NetworkError.MsgError(error: mess)
        }
    }else if Array(json.keys).contains("message"){
        if let mess = json["message"] as? String{
            error = NetworkError.MsgError(error: mess)
        }
    }
    
    return error
}
