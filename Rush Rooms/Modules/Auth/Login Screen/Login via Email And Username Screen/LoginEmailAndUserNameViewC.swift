//
//  LoginEmailAndUserNameViewC.swift
//  Rush Rooms
//
//  Created by Kv on 20/02/23.
//

import UIKit
import DropDown
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class LoginEmailAndUserNameViewC: UIViewController {
       
    @IBOutlet weak var languageVw, languageArabicVw, currencyArabicVw, currencyVw: UIView!
    @IBOutlet weak var eyeBtn, loginBtn, loginViaPhoneNoBtn, loginViaUsernameBtn, forgotPasswordBtn: UIButton!
    @IBOutlet weak var emialUsernameTxtVw, passwordTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var loginTitleLbl, loginSubTitleLbl, currencyLbl, languageLbl: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    var loginStatus: Bool = true
    var dropDown = DropDown()
    var viewModel = LoginViewModel()
    var loginModel: LoginModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setUpTextVw()
        self.setUpLanguage()
        self.bindLoginModel()
    }
    
    private func setupView(){
        GlobalMethods.shared.provideCornerRadius(view: self.loginBtn, cornerRadius: self.loginBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.loginViaPhoneNoBtn, self.loginViaUsernameBtn], cornerRadius: self.loginViaPhoneNoBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.languageVw, cornerRadius: self.languageVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.currencyVw, cornerRadius: self.currencyVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.flagImage, cornerRadius: self.flagImage.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        self.passwordTxtVw.isSecureTextEntry = true
        
        if USER_DEFAULTS.bool(forKey: UD.signUp) == true {
            USER_DEFAULTS.set(false, forKey: UD.signUp)
            self.showToast(message: KStrings.SignUpSuccessFull.localizedString)
        }
    }
    
    private func setUpTextVw(){
        self.passwordTxtVw.placeholder = PlaceholderTexts.enterPassword.localizedString
        self.passwordTxtVw.label.text = PlaceholderTexts.password.localizedString
        
        self.emialUsernameTxtVw.placeholder = PlaceholderTexts.enterEmail.localizedString
        self.emialUsernameTxtVw.label.text = PlaceholderTexts.email.localizedString
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.passwordTxtVw, self.emialUsernameTxtVw])
    }
    
    func languageBtnTap(_ sender:Int){
       if sender == 0{
           Localize.setCurrentLanguage(language: EN)
           UIView.appearance().semanticContentAttribute = .forceLeftToRight
           UIButton.appearance().semanticContentAttribute = .forceLeftToRight
           UITextView.appearance().semanticContentAttribute = .forceLeftToRight
           UITextField.appearance().semanticContentAttribute = .forceLeftToRight
           UIScrollView.appearance().semanticContentAttribute = .forceLeftToRight
           UIImageView.appearance().semanticContentAttribute = .forceLeftToRight
           UILabel.appearance().semanticContentAttribute = .forceLeftToRight
       }else{
           Localize.setCurrentLanguage(language: AR)
           UIView.appearance().semanticContentAttribute = .forceRightToLeft
           UIButton.appearance().semanticContentAttribute = .forceRightToLeft
           UITextView.appearance().semanticContentAttribute = .forceRightToLeft
           UITextField.appearance().semanticContentAttribute = .forceRightToLeft
           UIScrollView.appearance().semanticContentAttribute = .forceRightToLeft
           UIImageView.appearance().semanticContentAttribute = .forceRightToLeft
           UILabel.appearance().semanticContentAttribute = .forceRightToLeft
       }
        Root.Login()
   }
    
    private func setUpLanguage(){
        self.navigationController?.isNavigationBarHidden = true
        self.loginTitleLbl.text = KStrings.loginTitle.localizedString
        self.loginSubTitleLbl.text = KStrings.loginViaEmailSubTitle.localizedString
        self.forgotPasswordBtn.setTitle(KStrings.forgotPassword.localizedString, for: .normal)
        self.loginViaPhoneNoBtn.setTitle(KStrings.loginWithPhoneNo.localizedString, for: .normal)
        self.loginViaUsernameBtn.setTitle(KStrings.loginWithUsername.localizedString, for: .normal)
        self.loginBtn.setTitle(KStrings.logIn.localizedString, for: .normal)
        if Localize.currentLanguage() == EN{
            self.languageLbl.text = EN
            Localize.setCurrentLanguage(language: EN)
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
            UITextView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
            UIScrollView.appearance().semanticContentAttribute = .forceLeftToRight
            UIImageView.appearance().semanticContentAttribute = .forceLeftToRight
            UILabel.appearance().semanticContentAttribute = .forceLeftToRight
        }else{
            self.languageLbl.text = AR
            Localize.setCurrentLanguage(language: AR)
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
            UITextView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
            UIScrollView.appearance().semanticContentAttribute = .forceRightToLeft
            UIImageView.appearance().semanticContentAttribute = .forceRightToLeft
            UILabel.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
    
    @IBAction func languageBtn_Action(_ sender: UIButton) {
        let arr = [CommonTexts.english.localizedString, CommonTexts.arabic.localizedString]
        if Localize.currentLanguage() == EN{
            self.dropDown.anchorView = languageVw
        }else{
            self.dropDown.anchorView = languageArabicVw
        }
        self.dropDown.backgroundColor = UIColor.white
        self.dropDown.dataSource = arr
        self.dropDown.show()
        self.dropDown.selectionAction = { (index: Int, item: String) in
            if item == CommonTexts.english.localizedString{
                self.languageLbl.text = EN
            }else{
                self.languageLbl.text = AR
            }
            self.languageBtnTap(index)
        }
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        Root.Welcome()
    }
    
    @IBAction func eyeBtn_Action(_ sender: Any) {
        guard passwordTxtVw.isSecureTextEntry == true else {
            passwordTxtVw.isSecureTextEntry = true
            eyeBtn.setImage(UIImage(named: AssestsImageName.crossEyeIcon.rawValue), for: .normal)
            return
        }
        passwordTxtVw.isSecureTextEntry = false
        eyeBtn.setImage(UIImage(named: AssestsImageName.eyeIcon.rawValue), for: .normal)
    }
    
    @IBAction func loginBtn_Action(_ sender: Any) {
            if self.loginStatus == true{
                guard self.emialUsernameTxtVw.text == EMPTY else{
                    guard HHelper.isValidEmail(self.emialUsernameTxtVw.text ?? EMPTY) == false else {
                        guard self.passwordTxtVw.text == EMPTY else{
                            let language = Localize.currentLanguage()
                            let params = [passDicStrings.email: self.emialUsernameTxtVw.text ?? EMPTY,
                                          passDicStrings.password: self.passwordTxtVw.text ?? EMPTY,
                                          passDicStrings.languageType: language]
                             self.viewModel.LoginUser(params: params)
                         return
                        }
                        self.show_Alert(message: AlertsMsgs.emptypassword.localizedString)
                        return
                    }
                    self.show_Alert(message: AlertsMsgs.invalidEmail.localizedString)
                    return
                }
                self.show_Alert(message: AlertsMsgs.emptyEmail.localizedString)
            }else{
                guard self.emialUsernameTxtVw.text == EMPTY else {
                    guard self.passwordTxtVw.text == EMPTY else{
                        let language = Localize.currentLanguage()
                        let params = [passDicStrings.userName: self.emialUsernameTxtVw.text ?? EMPTY,
                                      passDicStrings.password: self.passwordTxtVw.text ?? EMPTY,
                                      passDicStrings.languageType: language]
                         self.viewModel.LoginUser(params: params)
                        return
                    }
                    self.show_Alert(message: AlertsMsgs.emptypassword.localizedString)
                    return
                }
                self.show_Alert(message: AlertsMsgs.emptyUsername.localizedString)
            }
    }
    
    @IBAction func forgotPasswordBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getForgotPasswordViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func loginViaPhoneNoBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getLoginPhoneNoViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func loginViaUsernameBtn_Action(_ sender: Any) {
        self.passwordTxtVw.text = EMPTY
        self.emialUsernameTxtVw.text = EMPTY
        guard self.loginStatus == true else{
            self.loginStatus = true
            self.loginSubTitleLbl.text = KStrings.loginViaEmailSubTitle.localizedString
            self.emialUsernameTxtVw.placeholder = PlaceholderTexts.enterEmail.localizedString
            self.emialUsernameTxtVw.label.text = PlaceholderTexts.email.localizedString
            self.loginViaUsernameBtn.setTitle(KStrings.loginWithUsername.localizedString, for: .normal)
            return
        }
        self.loginStatus = false
        self.loginSubTitleLbl.text = KStrings.loginViaUsernameSubTitle.localizedString
        self.emialUsernameTxtVw.placeholder = PlaceholderTexts.enterUsername.localizedString
        self.emialUsernameTxtVw.label.text = PlaceholderTexts.username.localizedString
        self.loginViaUsernameBtn.setTitle(KStrings.loginWithEmail.localizedString, for: .normal)
    }
    
    @IBAction func currencyBtn_Action(_ sender: Any) {
        let arr = [CommonTexts.usd.localizedString, CommonTexts.rupees.localizedString]
        if Localize.currentLanguage() == EN{
            self.dropDown.anchorView = currencyVw
        }else{
            self.dropDown.anchorView = currencyArabicVw
        }
        self.dropDown.backgroundColor = UIColor.white
        self.dropDown.dataSource = arr
        self.dropDown.show()
        self.dropDown.selectionAction = { (index: Int, item: String) in
            if item == CommonTexts.english.localizedString{
                self.currencyLbl.text = item
            }else{
                self.currencyLbl.text = item
            }
        }
    }
}
