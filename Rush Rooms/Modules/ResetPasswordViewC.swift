//
//  ResetPasswordViewC.swift
//  Rush Rooms
//
//  Created by Kv on 17/02/23.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ResetPasswordViewC: UIViewController {

    @IBOutlet weak var passwordTxtVw, confirmPasswordTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var resetBtn, eyePasswordBtn, eyeConfirmBtn: UIButton!
    @IBOutlet weak var resetTitleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setUpTextVw()
        self.setUpLanguage()
    }
    
    private func setupView(){
        GlobalMethods.shared.provideCornerRadius(view: self.resetBtn, cornerRadius: self.resetBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        self.passwordTxtVw.isSecureTextEntry = true
        self.confirmPasswordTxtVw.isSecureTextEntry = true
    }
    
    private func setUpTextVw(){
        
        self.passwordTxtVw.placeholder = PlaceholderTexts.enterPassword.localizedString
        self.passwordTxtVw.label.text = PlaceholderTexts.password.localizedString
        
        self.confirmPasswordTxtVw.placeholder = PlaceholderTexts.enterConfirmPassword.localizedString
        self.confirmPasswordTxtVw.label.text = PlaceholderTexts.confirmPassword.localizedString
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.passwordTxtVw, self.confirmPasswordTxtVw])
    }
    
    private func setUpLanguage(){
        self.resetBtn.setTitle(KStrings.reset.localizedString, for: .normal)
        self.resetTitleLbl.text = KStrings.resetPassword.localizedString
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getVerifyViewC()
        viewC.modalTransitionStyle = .crossDissolve
        viewC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func eyepasswordBtn_Action(_ sender: Any) {
        guard passwordTxtVw.isSecureTextEntry == true else {
            passwordTxtVw.isSecureTextEntry = true
            eyePasswordBtn.setImage(UIImage(named: AssestsImageName.crossEyeIcon.rawValue), for: .normal)
            return
        }
        passwordTxtVw.isSecureTextEntry = false
        eyePasswordBtn.setImage(UIImage(named: AssestsImageName.eyeIcon.rawValue), for: .normal)
    }
    
    @IBAction func eyeConfirmPasswordBtn_Action(_ sender: Any) {
        guard confirmPasswordTxtVw.isSecureTextEntry == true else {
            confirmPasswordTxtVw.isSecureTextEntry = true
            eyeConfirmBtn.setImage(UIImage(named: AssestsImageName.crossEyeIcon.rawValue), for: .normal)
            return
        }
        confirmPasswordTxtVw.isSecureTextEntry = false
        eyeConfirmBtn.setImage(UIImage(named: AssestsImageName.eyeIcon.rawValue), for: .normal)
    }
}
