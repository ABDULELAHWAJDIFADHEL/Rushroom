//
//  ForgotPasswordViewC.swift
//  Rush Rooms
//
//  Created by Kv on 20/02/23.
//

import UIKit
import ADCountryPicker
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ForgotPasswordViewC: UIViewController {

    @IBOutlet weak var resetViaPhoneNoLbl, resetViaEmailLbl, countryCodeLbl, forgotTitleLbl, forgotSubTitleLbl: UILabel!
    @IBOutlet weak var phoneNoTxtVw, emailTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var emailVw, phoneVw, countryCodeVw: UIView!
    @IBOutlet weak var phoneNoCheckBox, emailCheckBox: UIImageView!
    @IBOutlet weak var resetPasswordBtn: UIButton!
    
    var forgotStatus:Bool = true
    let picker = ADCountryPicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setUpTextVw()
        self.setUpCountryPicker()
        self.setUpLanguage()
    }
    
    private func setupView(){
        self.phoneVw.hideD()
        GlobalMethods.shared.provideCornerRadius(view: self.resetPasswordBtn, cornerRadius: self.resetPasswordBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.countryCodeVw, cornerRadius: FontSize.size_8.rawValue, borderColor: UIColor.colorWith(hexString: .SHADOW_COLOR).cgColor, borderWidth: ONE)
    }
    
    private func setUpTextVw(){
        self.phoneNoTxtVw.placeholder = PlaceholderTexts.enterMobileNumber.localizedString
        self.phoneNoTxtVw.label.text = PlaceholderTexts.mobileNumber.localizedString
        
        self.emailTxtVw.placeholder = PlaceholderTexts.enterEmail.localizedString
        self.emailTxtVw.label.text = PlaceholderTexts.email.localizedString
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.phoneNoTxtVw, self.emailTxtVw])
    }
    
    private func setUpLanguage(){
        self.forgotTitleLbl.text = KStrings.forgotPassword.localizedString
        self.forgotSubTitleLbl.text = KStrings.forgotSubTitleEmail.localizedString
        self.resetViaEmailLbl.text = KStrings.resetViaEmail.localizedString
        self.resetViaPhoneNoLbl.text = KStrings.resetViaPhoneNo.localizedString
        self.resetPasswordBtn.setTitle(KStrings.resetPassword.localizedString, for: .normal)
    }
    
    @IBAction func countryCodeBtn_Action(_ sender: Any) {
        self.openCountryPicker()
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetPasswordBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getOtpVerificationViewC()
        if self.forgotStatus == true{
            viewC.VCComeFrom = KStrings.resetViaEmail.localizedString
        }else{
            viewC.VCComeFrom = KStrings.resetViaPhoneNo.localizedString
        }
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func emailCheckBoxBtn_Action(_ sender: Any) {
        guard self.forgotStatus == true else {
            self.forgotStatus = true
            self.emailVw.showD()
            self.phoneVw.hideD()
            self.forgotSubTitleLbl.text = KStrings.forgotSubTitleEmail.localizedString
            self.emailCheckBox.image = UIImage(named: AssestsImageName.circleFillCheckBox.rawValue)
            self.phoneNoCheckBox.image = UIImage(named: AssestsImageName.circleCheckBox.rawValue)
            return
        }
    }
    
    @IBAction func phoneNoCheckBoxBtn_Action(_ sender: Any) {
        guard self.forgotStatus == false else {
            self.forgotStatus = false
            self.emailVw.hideD()
            self.phoneVw.showD()
            self.forgotSubTitleLbl.text = KStrings.forgotSubTitlePhone.localizedString
            self.emailCheckBox.image = UIImage(named: AssestsImageName.circleCheckBox.rawValue)
            self.phoneNoCheckBox.image = UIImage(named: AssestsImageName.circleFillCheckBox.rawValue)
            return
        }
    }
}
