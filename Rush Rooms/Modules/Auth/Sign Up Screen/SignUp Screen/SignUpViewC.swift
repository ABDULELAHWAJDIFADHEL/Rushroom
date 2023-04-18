//
//  SignUpViewC.swift
//  Rush Rooms
//
//  Created by Kv on 17/02/23.
//

import UIKit
import DropDown
import ADCountryPicker
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class SignUpViewC: UIViewController {
    
    @IBOutlet weak var firstNameTxtVw, lastNameTxtVw, countryRegionTxtVw, phoneNoTxtVw, referalCode: MDCOutlinedTextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var countryCodeVw: UIView!
    @IBOutlet weak var countryCodeLbl, signUpTitlleLbl, signUpSubTitleLbl: UILabel!
    
    var dropDown = DropDown()
    let picker = ADCountryPicker()
    var viewModel = SignUpViewModel()
    var signModel: SignModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setUpTextVw()
        self.setUpCountryPicker()
        self.setUpLanguage()
        self.bindSignModel()
    }
    
    private func setupView(){
        self.navigationController?.isNavigationBarHidden = true
        phoneNoTxtVw.keyboardType = .numberPad
        GlobalMethods.shared.provideCornerRadius(view: self.continueBtn, cornerRadius: self.continueBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.countryCodeVw, cornerRadius: FontSize.size_8.rawValue, borderColor: UIColor.colorWith(hexString: .SHADOW_COLOR).cgColor, borderWidth: ONE)
    }
    
    private func setUpTextVw(){
        self.firstNameTxtVw.placeholder = PlaceholderTexts.enterFirstName.localizedString
        self.firstNameTxtVw.label.text = PlaceholderTexts.firstName.localizedString
        
        self.lastNameTxtVw.placeholder = PlaceholderTexts.enterLastName.localizedString
        self.lastNameTxtVw.label.text = PlaceholderTexts.lastName.localizedString
        
        self.countryRegionTxtVw.placeholder = PlaceholderTexts.countryRegion.localizedString
        self.countryRegionTxtVw.label.text = PlaceholderTexts.countryRegion.localizedString
        
        self.phoneNoTxtVw.placeholder = PlaceholderTexts.enterMobileNumber.localizedString
        self.phoneNoTxtVw.label.text = PlaceholderTexts.mobileNumber.localizedString
        
        self.referalCode.placeholder = PlaceholderTexts.enterReferalCode.localizedString
        self.referalCode.label.text = PlaceholderTexts.referalCode.localizedString
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.firstNameTxtVw, self.lastNameTxtVw, self.countryRegionTxtVw, self.phoneNoTxtVw, self.referalCode])
    }
    
    private func setUpLanguage(){
        self.signUpTitlleLbl.text = KStrings.signUpTitle.localizedString
        self.signUpSubTitleLbl.text = KStrings.signUpSubTitle.localizedString
        self.continueBtn.setTitle(KStrings.continueBtn.localizedString, for: .normal)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        Root.Welcome()
    }
    
    @IBAction func countryDropBtn_Action(_ sender: UIButton) {
        self.openCountryPicker()
    }
    
    @IBAction func countryCodeBtn_Action(_ sender: Any) {
        print("huihui")
    }
    
    @IBAction func continueBtn_Action(_ sender: Any) {
        self.GoToValidate()
    }
}
