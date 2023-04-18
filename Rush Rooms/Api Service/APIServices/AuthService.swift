//
//  AuthService.swift
//  Bayin
//
//  Created by Call Soft on 22/09/22.
//

import Foundation

enum AuthService:ServiceProtocol{
    case userlogin(params:[String:Any])
    case checkUser(params: [String: Any])
    case signUp(params: [String: Any])
    
    var baseURL: URL{
        return URL(string: AppConfig.getServiceHostURL())!
    }
    
    var path: String {
        switch self {
        case .checkUser:
            return UserServices.CheckUser
        case .userlogin:
            return UserServices.UserLogin
        case .signUp:
            return UserServices.UserSignUp
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .checkUser:
            return HTTPMethod.put
        case .userlogin:
            return HTTPMethod.post
        case .signUp:
            return HTTPMethod.post
        }
    }
    
    var task: Task{
        switch self {
        case .checkUser(let params):
            return Task.requestParameters(params)
        case .userlogin(let params):
            return Task.requestParameters(params)
        case .signUp(let params):
            return Task.requestParameters(params)
        }
    }
    
    var headers: Headers?{
        switch self {
        case .checkUser:
            return ["Content-Type":"application/json"]
        case .userlogin:
            return ["Content-Type":"application/json"]
        case .signUp:
            return ["Content-Type":"application/json"]
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .checkUser:
            return .json
        case .userlogin:
            return .json
        case .signUp:
            return .json
        }
    }
    
}
