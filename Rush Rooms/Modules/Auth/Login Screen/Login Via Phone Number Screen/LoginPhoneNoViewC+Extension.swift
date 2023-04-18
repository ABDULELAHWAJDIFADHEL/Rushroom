//
//  LoginPhoneNoViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 20/02/23.
//

import Foundation
import UIKit
import ADCountryPicker

extension LoginPhoneNoViewC: ADCountryPickerDelegate{
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
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
