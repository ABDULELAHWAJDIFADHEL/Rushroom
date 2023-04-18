//
//  SignUpVIewC+Model.swift
//  Rush Rooms
//
//  Created by Kv on 14/03/23.
//

import Foundation
import UIKit

struct signUpModel{
    
    // Sign Up
    var firstName: String?
    var lastName: String?
    var countryRegion: String?
    var countryCode: String?
    var phoneNumber: String?
    var referralCode: String?
    
    // Sign Up Add Info
    var email: String?
    var userName: String?
    var dob: String?
    var gender: String?
    var password: String?
    
    init(firstName: String? = nil, lastName: String? = nil, countryRegion: String? = nil, countryCode: String? = nil, phoneNumber: String? = nil, referralCode: String? = nil, email: String? = nil, userName: String? = nil, dob: String? = nil, gender: String? = nil, password: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.countryRegion = countryRegion
        self.countryCode = countryCode
        self.phoneNumber = phoneNumber
        self.referralCode = referralCode
        self.email = email
        self.userName = userName
        self.dob = dob
        self.gender = gender
        self.password = password
    }
}



struct SignModel: Codable {

    let code: Int?
    let message: String?

    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
