//
//  ChangePasswordViewC.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ChangePasswordViewC: UIViewController {

    @IBOutlet weak var currentPasswordTxtVw, newPasswordTxtVw, confirmPasswordTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var changePasswordBtn, currentEyeBtn, newEyeBtn, confirmEyeBtn: UIButton!
    @IBOutlet weak var changePasswordTitleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.setUpTextVw()
    }
    
    private func setUpViews(){
        GlobalMethods.shared.provideCornerRadius(view: self.changePasswordBtn, cornerRadius: self.changePasswordBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        self.currentPasswordTxtVw.isSecureTextEntry = true
        self.newPasswordTxtVw.isSecureTextEntry = true
        self.confirmPasswordTxtVw.isSecureTextEntry = true
    }
    
    private func setUpTextVw(){
        self.confirmPasswordTxtVw.placeholder = PlaceholderTexts.enterConfirmPassword.localizedString
        self.confirmPasswordTxtVw.label.text = PlaceholderTexts.confirmPassword.localizedString
        
        self.newPasswordTxtVw.placeholder = PlaceholderTexts.enterNewPassword.localizedString
        self.newPasswordTxtVw.label.text = PlaceholderTexts.newPassword.localizedString
        
        self.currentPasswordTxtVw.placeholder = PlaceholderTexts.enterCurrentPassword.localizedString
        self.currentPasswordTxtVw.label.text = PlaceholderTexts.currentPassword.localizedString
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.confirmPasswordTxtVw, self.newPasswordTxtVw, self.currentPasswordTxtVw])
    }
    
    @IBAction func currentEyeBtn_Action(_ sender: Any) {
        guard currentPasswordTxtVw.isSecureTextEntry == true else {
            currentPasswordTxtVw.isSecureTextEntry = true
            currentEyeBtn.setImage(UIImage(named: AssestsImageName.crossEyeIcon.rawValue), for: .normal)
            return
        }
        currentPasswordTxtVw.isSecureTextEntry = false
        currentEyeBtn.setImage(UIImage(named: AssestsImageName.eyeIcon.rawValue), for: .normal)
    }
    
    @IBAction func newEyeBtn_Action(_ sender: Any) {
        guard newPasswordTxtVw.isSecureTextEntry == true else {
            newPasswordTxtVw.isSecureTextEntry = true
            newEyeBtn.setImage(UIImage(named: AssestsImageName.crossEyeIcon.rawValue), for: .normal)
            return
        }
        newPasswordTxtVw.isSecureTextEntry = false
        newEyeBtn.setImage(UIImage(named: AssestsImageName.eyeIcon.rawValue), for: .normal)
    }
    
    @IBAction func confirmEyeBtn_Action(_ sender: Any) {
        guard confirmPasswordTxtVw.isSecureTextEntry == true else {
            confirmPasswordTxtVw.isSecureTextEntry = true
            confirmEyeBtn.setImage(UIImage(named: AssestsImageName.crossEyeIcon.rawValue), for: .normal)
            return
        }
        confirmPasswordTxtVw.isSecureTextEntry = false
        confirmEyeBtn.setImage(UIImage(named: AssestsImageName.eyeIcon.rawValue), for: .normal)
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func changePasswordBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getVerifyViewC()
        viewC.comeFromSignUp = false
        viewC.modalTransitionStyle = .crossDissolve
        viewC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(viewC, animated: true)
    }
}
