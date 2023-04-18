//
//  OtpVerificationViewC.swift
//  Rush Rooms
//
//  Created by Kv on 20/02/23.
//

import UIKit

class OtpVerificationViewC: UIViewController {
    
    @IBOutlet weak var otpStackVw: UIStackView!
    @IBOutlet weak var submitBtn, resendBtn: UIButton!
    @IBOutlet weak var recievedCodeLbl, emailPhoneNoLbl, otpVerifySubTitleLbl, otpVerifyTitleLbl: UILabel!
    
    let otpStackView = OTPStackView()
    var VCComeFrom: String = KStrings.logIn.localizedString
//    KStrings.logIn.localizedString
//    KStrings.resetViaEmail.localizedString
//    KStrings.resetViaPhoneNo.localizedString
//    KStrings.signUpEmail.localizedString
//    KStrings.signUpPhoneNo.localizedString
    var signUpViewModel = signUpModel()
    var viewModel = OtpViewModel()
    var signModel: SignModel?
    var loginModel: LoginModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setOtpVw()
        self.setUpLanguage()
        self.bindSignUpModel()
        self.bindLoginViaPhoneModel()
    }
    
    private func setupView(){
        GlobalMethods.shared.provideCornerRadius(view: self.submitBtn, cornerRadius: self.submitBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        switch VCComeFrom {
        case KStrings.logIn.localizedString:
            self.emailPhoneNoLbl.text = (self.signUpViewModel.countryCode ?? EMPTY) + EMPTY_SPACE + (self.signUpViewModel.phoneNumber ?? EMPTY)
        case KStrings.signUpEmail.localizedString:
            self.emailPhoneNoLbl.text = self.signUpViewModel.email ?? EMPTY
        case KStrings.signUpPhoneNo.localizedString:
            self.emailPhoneNoLbl.text = (self.signUpViewModel.countryCode ?? EMPTY) + EMPTY_SPACE + (self.signUpViewModel.phoneNumber ?? EMPTY)
        case KStrings.resetViaEmail.localizedString:
            self.otpVerifyTitleLbl.text = KStrings.confirmEmail.localizedString
        case KStrings.resetViaPhoneNo.localizedString:
            self.otpVerifyTitleLbl.text = KStrings.confirmPhoneNo.localizedString
        default:
            self.otpVerifyTitleLbl.text = KStrings.confirmPhoneNo.localizedString
        }
    }
    
    fileprivate func setOtpVw(){
        otpStackVw.addSubview(otpStackView)
        otpStackView.delegate = self
        otpStackView.heightAnchor.constraint(equalTo: otpStackVw.heightAnchor).isActive = true
        otpStackView.centerXAnchor.constraint(equalTo: otpStackVw.centerXAnchor).isActive = true
        otpStackView.centerYAnchor.constraint(equalTo: otpStackVw.centerYAnchor).isActive = true
    }
    
    private func setUpLanguage(){
        self.otpVerifySubTitleLbl.text = KStrings.otpSubTitle.localizedString
        self.recievedCodeLbl.text = KStrings.havenotRecivedCode.localizedString
        self.resendBtn.setTitle(KStrings.resend.localizedString, for: .normal)
        self.submitBtn.setTitle(KStrings.submit.localizedString, for: .normal)
        switch VCComeFrom {
        case KStrings.logIn.localizedString:
            self.otpVerifyTitleLbl.text = KStrings.confirmPhoneNo.localizedString
        case KStrings.signUpEmail.localizedString:
            self.otpVerifyTitleLbl.text = KStrings.confirmEmail.localizedString
        case KStrings.signUpPhoneNo.localizedString:
            self.otpVerifyTitleLbl.text = KStrings.confirmPhoneNo.localizedString
        case KStrings.resetViaEmail.localizedString:
            self.otpVerifyTitleLbl.text = KStrings.confirmEmail.localizedString
        case KStrings.resetViaPhoneNo.localizedString:
            self.otpVerifyTitleLbl.text = KStrings.confirmPhoneNo.localizedString
        default:
            self.otpVerifyTitleLbl.text = KStrings.confirmPhoneNo.localizedString
        }
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitBtn_Action(_ sender: Any) {
        if self.otpStackView.getOTP() == EMPTY{
            self.show_Alert(message: AlertsMsgs.emptyOtp.localizedString)
        }else{
            self.signUpApi()
        }
    }
    
    @IBAction func resendBtn_Action(_ sender: Any) {
        
    }
}
