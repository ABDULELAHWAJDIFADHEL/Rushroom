//
//  SignUpAddInfoViewC.swift
//  Rush Rooms
//
//  Created by Kv on 17/02/23.
//

import UIKit
import DropDown
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class SignUpAddInfoViewC: UIViewController {

    @IBOutlet weak var continueBtn, eyePasswordBtn, eyeConfirmPasswordBtn: UIButton!
    @IBOutlet weak var emailTxtVw, usernameTxtVw, dobTxtVw, genderTxtVw, passwordTxtVw, confirmPasswordTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var signUpTitleLbl: UILabel!
    
    var dropDown = DropDown()
    var signUpViewModel = signUpModel()
    var viewModel = SignUpViewModel()
    var signModel : SignModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setUpTextVw()
        self.setUpLanguage()
        self.bindSignAddInfoModel()
    }
    
    lazy var genderArr = {
        return [CommonTexts.male.localizedString, CommonTexts.female.localizedString, CommonTexts.other.localizedString]
    }()
    
    private func setupView(){
        GlobalMethods.shared.provideCornerRadius(view: self.continueBtn, cornerRadius: self.continueBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        self.passwordTxtVw.isSecureTextEntry = true
        self.confirmPasswordTxtVw.isSecureTextEntry = true
    }
    
    private func setUpTextVw(){
        self.emailTxtVw.placeholder = PlaceholderTexts.enterEmail.localizedString
        self.emailTxtVw.label.text = PlaceholderTexts.email.localizedString
        
        self.usernameTxtVw.placeholder = PlaceholderTexts.enterUsername.localizedString
        self.usernameTxtVw.label.text = PlaceholderTexts.username.localizedString
        
        self.dobTxtVw.placeholder = PlaceholderTexts.dob.localizedString
        self.dobTxtVw.label.text = PlaceholderTexts.dob.localizedString
        
        self.genderTxtVw.placeholder = PlaceholderTexts.gender.localizedString
        self.genderTxtVw.label.text = PlaceholderTexts.gender.localizedString
        
        self.passwordTxtVw.placeholder = PlaceholderTexts.enterPassword.localizedString
        self.passwordTxtVw.label.text = PlaceholderTexts.password.localizedString
        
        self.confirmPasswordTxtVw.placeholder = PlaceholderTexts.enterConfirmPassword.localizedString
        self.confirmPasswordTxtVw.label.text = PlaceholderTexts.confirmPassword.localizedString
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.emailTxtVw, self.usernameTxtVw, self.dobTxtVw, self.genderTxtVw, self.passwordTxtVw, self.confirmPasswordTxtVw])
    }
    
    private func setUpLanguage(){
        self.signUpTitleLbl.text = KStrings.signUpAddInfoTitle.localizedString
        self.continueBtn.setTitle(KStrings.continueBtn.localizedString, for: .normal)
    }
    
    @IBAction func dobBtn_Action(_ sender: Any) {
        self.openDateAlertPicker()
    }
    
    @IBAction func genderBtn_Action(_ sender: UIButton) {
        self.dropDown.anchorView = sender
        self.dropDown.backgroundColor = UIColor.white
        self.dropDown.dataSource = self.genderArr
        self.dropDown.show()
        self.dropDown.selectionAction = { (index: Int, item: String) in
            self.genderTxtVw.text = item
        }
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func eyePasswordBtn_Action(_ sender: Any) {
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
            eyeConfirmPasswordBtn.setImage(UIImage(named: AssestsImageName.crossEyeIcon.rawValue), for: .normal)
            return
        }
        confirmPasswordTxtVw.isSecureTextEntry = false
        eyeConfirmPasswordBtn.setImage(UIImage(named: AssestsImageName.eyeIcon.rawValue), for: .normal)
    }
    
    @IBAction func continueBtn_Action(_ sender: Any) {
        self.GoToValidate()
    }
}
