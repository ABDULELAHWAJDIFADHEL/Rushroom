//
//  OtpVerificationViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 20/02/23.
//

import Foundation
import UIKit

extension OtpVerificationViewC: OTPDelegate {
    
    func didChangeValidity(isValid: Bool) {
       print("huihui")
    }
    
}

extension OtpVerificationViewC{
    
    func signUpApi(){
        switch VCComeFrom {
        case KStrings.logIn.localizedString:
            let language = Localize.currentLanguage()
            let params = [passDicStrings.phoneNumber: self.signUpViewModel.phoneNumber ?? EMPTY,
                          passDicStrings.password: EMPTY,
                          passDicStrings.languageType: language]
            self.viewModel.LoginUser(params: params)
        case KStrings.signUpEmail.localizedString:
            let params = [passDicStrings.phoneNumber: self.signUpViewModel.phoneNumber ?? EMPTY,
                          passDicStrings.countryCode: self.signUpViewModel.countryCode ?? EMPTY,
                          passDicStrings.countryRegion: self.signUpViewModel.countryRegion ?? EMPTY,
                          passDicStrings.firstName: self.signUpViewModel.firstName ?? EMPTY,
                          passDicStrings.lastName: self.signUpViewModel.lastName ?? EMPTY,
                          passDicStrings.userName: self.signUpViewModel.userName ?? EMPTY,
                          passDicStrings.referralCode: self.signUpViewModel.referralCode ?? EMPTY,
                          passDicStrings.dob: self.signUpViewModel.dob ?? EMPTY,
                          passDicStrings.email: self.signUpViewModel.email ?? EMPTY,
                          passDicStrings.faceId: EMPTY,
                          passDicStrings.password: self.signUpViewModel.password ?? EMPTY,]
             self.viewModel.signUpUser(params: params)
        case KStrings.signUpPhoneNo.localizedString:
            let viewC = DIConfigurator.sharedInst().getSignUpAddInfoViewC()
            viewC.signUpViewModel = self.signUpViewModel
            self.navigationController?.pushViewController(viewC, animated: true)
        case KStrings.resetViaEmail.localizedString:
            let viewC = DIConfigurator.sharedInst().getResetPasswordViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        case KStrings.resetViaPhoneNo.localizedString:
            let viewC = DIConfigurator.sharedInst().getResetPasswordViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        default:
            Root.Login()
        }
    }
    
    
    func GoToLogin(){
        switch VCComeFrom {
        case KStrings.logIn.localizedString:
            Root.Home()
        case KStrings.signUpEmail.localizedString:
            Root.Login()
        case KStrings.signUpPhoneNo.localizedString:
            let viewC = DIConfigurator.sharedInst().getSignUpAddInfoViewC()
            viewC.signUpViewModel = self.signUpViewModel
            self.navigationController?.pushViewController(viewC, animated: true)
        case KStrings.resetViaEmail.localizedString:
            let viewC = DIConfigurator.sharedInst().getResetPasswordViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        case KStrings.resetViaPhoneNo.localizedString:
            let viewC = DIConfigurator.sharedInst().getResetPasswordViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        default:
            Root.Login()
        }
    }
}
