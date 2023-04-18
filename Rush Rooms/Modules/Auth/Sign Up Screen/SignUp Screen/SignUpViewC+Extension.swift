//
//  SignUpViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 17/02/23.
//

import Foundation
import ADCountryPicker

extension SignUpViewC{
    
    func GoToValidate(){
        guard self.firstNameTxtVw.text == EMPTY else {
            guard self.lastNameTxtVw.text == EMPTY else {
                guard self.countryRegionTxtVw.text == EMPTY else {
                    guard self.phoneNoTxtVw.text == EMPTY else {
                       let params = [passDicStrings.email: EMPTY,
                                  passDicStrings.phoneNumber: self.phoneNoTxtVw.text ?? EMPTY]
                        self.viewModel.checkUser(params: params)
                        return
                    }
                    self.show_Alert(message: AlertsMsgs.emptyPhoneNumber.localizedString)
                    return
                }
                self.show_Alert(message: AlertsMsgs.emptyCountry.localizedString)
                return
            }
            self.show_Alert(message: AlertsMsgs.emptyLastName.localizedString)
            return
        }
        self.show_Alert(message: AlertsMsgs.emptyFirstName.localizedString)
    }
    
    func GoToVerification(){
        let viewC = DIConfigurator.sharedInst().getOtpVerificationViewC()
        viewC.VCComeFrom = KStrings.signUpPhoneNo.localizedString
        viewC.signUpViewModel = signUpModel(firstName: self.firstNameTxtVw.text ?? EMPTY, lastName: self.lastNameTxtVw.text ?? EMPTY, countryRegion: self.countryRegionTxtVw.text ?? EMPTY, countryCode: self.countryCodeLbl.text ?? EMPTY, phoneNumber: self.phoneNoTxtVw.text ?? EMPTY, referralCode: self.referalCode.text ?? EMPTY)
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}

extension SignUpViewC: ADCountryPickerDelegate{
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        self.countryRegionTxtVw.text = name
        self.countryCodeLbl.text = dialCode
        self.dismiss(animated: true)
    }
    
    func setUpCountryPicker(){
        self.picker.delegate = self
        self.picker.showCallingCodes = true
        self.picker.showFlags = true
        self.picker.pickerTitle = KStrings.countryCodeMsg.localizedString
        self.picker.forceDefaultCountryCode = false
        self.picker.alphabetScrollBarTintColor = UIColor.black
        self.picker.alphabetScrollBarBackgroundColor = UIColor.clear
        self.picker.closeButtonTintColor = UIColor.black
        self.picker.font = UIFont.font(name: .gilroy, size: .size_18)
        self.picker.flagHeight = 35
        self.picker.hidesNavigationBarWhenPresentingSearch = false
        self.picker.searchBarBackgroundColor = UIColor.white
    }
    
    func openCountryPicker(){
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
    }
}
