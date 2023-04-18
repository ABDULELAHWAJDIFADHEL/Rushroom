//
//  WelcomeScreenViewC.swift
//  Rush Rooms
//
//  Created by Kv on 16/02/23.
//

import UIKit
import DropDown

class WelcomeScreenViewC: UIViewController {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var languageVw, currencyVw, languageArabicVw, currencyArabicVw: UIView!
    @IBOutlet weak var welcomeTitleTwoLbl, welcomeTitleOneLbl, welcomeSubTitleLbl, alreadyHaveAccountLbl, languageLbl, currencyLbl: UILabel!
    @IBOutlet weak var loginBtn, signUpBtn, skipLoginBtn: UIButton!
    
    var dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setUpLanguage()
    }
    
    fileprivate func setupView(){
        USER_DEFAULTS.set(false, forKey: UD.signUp)
        GlobalMethods.shared.provideCornerRadius(view: self.signUpBtn, cornerRadius: self.signUpBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.languageVw, cornerRadius: self.languageVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.currencyVw, cornerRadius: self.currencyVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.flagImage, cornerRadius: self.flagImage.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.skipLoginBtn, cornerRadius: self.skipLoginBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
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
        Root.Welcome()
   }
    
    private func setUpLanguage(){
        self.navigationController?.isNavigationBarHidden = true
        self.welcomeTitleOneLbl.text = KStrings.letsGet.localizedString
        self.welcomeTitleTwoLbl.text = KStrings.started.localizedString
        self.welcomeSubTitleLbl.text = KStrings.welcomeSubTitle.localizedString
        self.alreadyHaveAccountLbl.text = KStrings.alreadyHaveAccount.localizedString
        self.signUpBtn.setTitle(KStrings.signUp.localizedString, for: .normal)
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
    
    @IBAction func signUpBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getSignUpViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func skipLoginBtn_Action(_ sender: Any) {
        APPLICATION_TYPE = ApplicationTypeEnum.skip.rawValue
        Root.Home()
    }
    
    @IBAction func loginBtn_Action(_ sender: Any) {
        Root.Login()
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
