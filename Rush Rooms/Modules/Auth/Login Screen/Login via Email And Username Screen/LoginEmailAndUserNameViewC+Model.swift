//
//  LoginEmailAndUserNameViewC+Model.swift
//  Rush Rooms
//
//  Created by Kv on 15/03/23.
//

import Foundation


struct LoginModel: Codable {

    let code: Int?
    let message: String?
    let token: String?
    let activeUser: LoginActiveUser?

    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
        case token = "token"
        case activeUser = "activeUser"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        activeUser = try values.decodeIfPresent(LoginActiveUser.self, forKey: .activeUser)
    }

}

struct LoginActiveUser: Codable {

    let isPhoneVerify: Bool?
    let email: String?
    let isEmailVerify: Bool?
    let profilePic: String?
    let socailToken: String?
    let userType: String?
    let userStatus: String?
    let Id: String?
    let phoneNumber: String?
    let countryCode: String?
    let countryRegion: String?
    let firstName: String?
    let lastName: String?
    let userName: String?
    let referralCode: String?
    let dob: String?
    let faceId: String?
    let password: String?
    let registerDate: String?
    let createdAt: String?
    let updatedAt: String?
    let _v: Int?
    let deviceToken: String?
    let jwtToken: String?

    private enum CodingKeys: String, CodingKey {
        case isPhoneVerify = "is_phone_verify"
        case email = "email"
        case isEmailVerify = "is_email_verify"
        case profilePic = "profilePic"
        case socailToken = "socailToken"
        case userType = "userType"
        case userStatus = "userStatus"
        case Id = "_id"
        case phoneNumber = "phoneNumber"
        case countryCode = "countryCode"
        case countryRegion = "countryRegion"
        case firstName = "firstName"
        case lastName = "lastName"
        case userName = "userName"
        case referralCode = "referralCode"
        case dob = "dob"
        case faceId = "faceId"
        case password = "password"
        case registerDate = "registerDate"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case _v = "__v"
        case deviceToken = "deviceToken"
        case jwtToken = "jwtToken"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isPhoneVerify = try values.decodeIfPresent(Bool.self, forKey: .isPhoneVerify)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        isEmailVerify = try values.decodeIfPresent(Bool.self, forKey: .isEmailVerify)
        profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
        socailToken = try values.decodeIfPresent(String.self, forKey: .socailToken)
        userType = try values.decodeIfPresent(String.self, forKey: .userType)
        userStatus = try values.decodeIfPresent(String.self, forKey: .userStatus)
        Id = try values.decodeIfPresent(String.self, forKey: .Id)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        countryRegion = try values.decodeIfPresent(String.self, forKey: .countryRegion)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
        referralCode = try values.decodeIfPresent(String.self, forKey: .referralCode)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        faceId = try values.decodeIfPresent(String.self, forKey: .faceId)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        registerDate = try values.decodeIfPresent(String.self, forKey: .registerDate)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        _v = try values.decodeIfPresent(Int.self, forKey: ._v)
        deviceToken = try values.decodeIfPresent(String.self, forKey: .deviceToken)
        jwtToken = try values.decodeIfPresent(String.self, forKey: .jwtToken)
    }

}
