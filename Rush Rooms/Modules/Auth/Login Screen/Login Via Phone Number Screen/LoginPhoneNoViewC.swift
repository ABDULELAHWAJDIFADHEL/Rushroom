//
//  LoginPhoneNoViewC.swift
//  Rush Rooms
//
//  Created by Kv on 20/02/23.
//

import UIKit
import DropDown
import ADCountryPicker
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class LoginPhoneNoViewC: UIViewController {

    @IBOutlet weak var phoneNoTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var countryCodeVw: UIView!
    @IBOutlet weak var loginTitleLbl, loginSubTitleLbl, countryCodeLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    let picker = ADCountryPicker()
    var dropDown = DropDown()
    var viewModel = LoginViaPhoneViewModel()
    var signModel: SignModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setUpTextVw()
        self.setUpCountryPicker()
        self.setUpLanguage()
        self.bindLoginModel()
    }
    
    private func setupView(){
        GlobalMethods.shared.provideCornerRadius(view: self.loginBtn, cornerRadius: self.loginBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        
        GlobalMethods.shared.provideCornerRadius(view: self.countryCodeVw, cornerRadius: FontSize.size_8.rawValue, borderColor: UIColor.colorWith(hexString: .SHADOW_COLOR).cgColor, borderWidth: ONE)
        
        phoneNoTxtVw.keyboardType = .numberPad
    }
    
    private func setUpTextVw(){
        self.phoneNoTxtVw.placeholder = PlaceholderTexts.enterMobileNumber.localizedString
        self.phoneNoTxtVw.label.text = PlaceholderTexts.mobileNumber.localizedString
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.phoneNoTxtVw])
    }
    
    private func setUpLanguage(){
        self.loginTitleLbl.text = KStrings.loginTitle.localizedString
        self.loginSubTitleLbl.text = KStrings.loginViaPhoneSubTitle.localizedString
        self.loginBtn.setTitle(KStrings.sendOtp.localizedString, for: .normal)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginBtn_Action(_ sender: Any) {
        guard self.phoneNoTxtVw.text == EMPTY else{
            let params = [passDicStrings.email: EMPTY,
                       passDicStrings.phoneNumber: self.phoneNoTxtVw.text ?? EMPTY]
             self.viewModel.checkUser(params: params)
            return
        }
        self.show_Alert(message: AlertsMsgs.emptyPhoneNumber.localizedString)
    }
    
    @IBAction func countryCodeBtn_Action(_ sender: Any) {
        self.openCountryPicker()
    }
    
    func GoToVerification(){
        let viewC = DIConfigurator.sharedInst().getOtpVerificationViewC()
        viewC.VCComeFrom = KStrings.logIn.localizedString
        viewC.signUpViewModel = signUpModel(countryCode: self.countryCodeLbl.text ?? EMPTY, phoneNumber: self.phoneNoTxtVw.text ?? EMPTY)
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
