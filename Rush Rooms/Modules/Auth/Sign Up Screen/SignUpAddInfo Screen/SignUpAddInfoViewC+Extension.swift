//
//  SignUpAddInfoViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 17/02/23.
//

import Foundation
import UIKit

extension SignUpAddInfoViewC{
    
    func GoToValidate(){
        guard self.emailTxtVw.text == EMPTY else {
            guard self.usernameTxtVw.text == EMPTY else {
                guard self.dobTxtVw.text == EMPTY else {
                    guard self.genderTxtVw.text == EMPTY else {
                        guard self.passwordTxtVw.text == EMPTY else {
                            guard self.confirmPasswordTxtVw.text == EMPTY else {
                                guard HHelper.isValidEmail(self.emailTxtVw.text ?? EMPTY) == false else {
                                    guard self.confirmPasswordTxtVw.text != self.passwordTxtVw.text else {
                                        let params = [passDicStrings.email: self.emailTxtVw.text ?? EMPTY,
                                                      passDicStrings.phoneNumber: EMPTY]
                                         self.viewModel.checkUser(params: params)
                                        return
                                    }
                                    self.show_Alert(message: AlertsMsgs.unequalPasssword.localizedString)
                                    return
                                }
                                self.show_Alert(message: AlertsMsgs.invalidEmail.localizedString)
                                return
                            }
                            self.show_Alert(message: AlertsMsgs.emptyConfirmPassword.localizedString)
                            return
                        }
                        self.show_Alert(message: AlertsMsgs.emptypassword.localizedString)
                        return
                    }
                    self.show_Alert(message: AlertsMsgs.emptyGender.localizedString)
                    return
                }
                self.show_Alert(message: AlertsMsgs.emptyDob.localizedString)
                return
            }
            self.show_Alert(message: AlertsMsgs.emptyUsername.localizedString)
            return
        }
        self.show_Alert(message: AlertsMsgs.emptyEmail.localizedString)
    }
    
    func GoToVerification(){
        let viewC = DIConfigurator.sharedInst().getOtpVerificationViewC()
        viewC.VCComeFrom = KStrings.signUpEmail.localizedString
        viewC.signUpViewModel = signUpModel(firstName: self.signUpViewModel.firstName ?? EMPTY, lastName: self.signUpViewModel.lastName ?? EMPTY, countryRegion: self.signUpViewModel.countryRegion ?? EMPTY, countryCode: self.signUpViewModel.countryCode ?? EMPTY, phoneNumber: self.signUpViewModel.phoneNumber ?? EMPTY, referralCode: self.signUpViewModel.referralCode ?? EMPTY, email: self.emailTxtVw.text ?? EMPTY, userName: self.usernameTxtVw.text ?? EMPTY, dob: self.dobTxtVw.text ?? EMPTY, gender: self.genderTxtVw.text ?? EMPTY, password: self.passwordTxtVw.text ?? EMPTY)
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
//9045145863
extension SignUpAddInfoViewC{
    internal func openDateAlertPicker() -> Void {
        var selectedDate = Date()
        let dates = HHelper.shared.currentCalander()
        let alert = UIAlertController(style: .actionSheet, title: nil)
        alert.addDatePicker(mode: .date, date: dates.0, minimumDate: dates.1, maximumDate: dates.2) { date in
            selectedDate = date
        }
        alert.set(title: CommonTexts.selectDob.localizedString, font:  UIFont.font(name: .gilroy, weight: FontWeight.SemiBold, size: .size_16), color: UIColor.colorWith(hexString: .BLACK_COLOR))
        alert.addAction(title: CommonTexts.ok.localizedString, style: .cancel, handler: { action in
            self.dobTxtVw.text = Date.getDateStringWithDatee(DateFormat.apiDate, date: selectedDate)
        })
        alert.show(style: .light)
    }
}
