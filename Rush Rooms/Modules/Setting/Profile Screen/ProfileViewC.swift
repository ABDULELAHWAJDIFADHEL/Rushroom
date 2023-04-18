//
//  ProfileViewC.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ProfileViewC: UIViewController {

    @IBOutlet weak var nameTxtVw, emailTxtVw, dobTxtVw, genderTxtVw, nationalIdTxtVw, nationalityTxtVw, referalCodeTxtVw, expiryTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var cameraVw, updateVw, bottomVw: UIView!
    @IBOutlet weak var editBtn, verifyBtn, updateBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileLbl, profileNameLbl, profileEmailLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.setUpTextVw()
    }
    
    private func setUpViews(){
        self.cameraVw.hideD()
        self.verifyBtn.hideD()
        self.updateVw.hideD()
       
        
        GlobalMethods.shared.provideCornerRadius(view: self.editBtn, cornerRadius: FontSize.size_6.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.profileImage, cornerRadius: self.profileImage.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.verifyBtn, cornerRadius: self.verifyBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.updateBtn, cornerRadius: self.updateBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.cameraVw, cornerRadius: self.cameraVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideThreeCornerRadius(view: self.updateVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    private func setUpTextVw(){
        self.nameTxtVw.placeholder = PlaceholderTexts.enterFullName.localizedString
        self.nameTxtVw.label.text = PlaceholderTexts.fullname.localizedString
        
        self.emailTxtVw.placeholder = PlaceholderTexts.enterEmail.localizedString
        self.emailTxtVw.label.text = PlaceholderTexts.email.localizedString
        
        self.dobTxtVw.placeholder = PlaceholderTexts.dob.localizedString
        self.dobTxtVw.label.text = PlaceholderTexts.dob.localizedString
        
        self.genderTxtVw.placeholder = PlaceholderTexts.gender.localizedString
        self.genderTxtVw.label.text = PlaceholderTexts.gender.localizedString
        
        self.nationalIdTxtVw.placeholder = PlaceholderTexts.nationality.localizedString
        self.nationalIdTxtVw.label.text = PlaceholderTexts.nationality.localizedString
        
        self.nationalityTxtVw.placeholder = PlaceholderTexts.enterNationalIdNumber.localizedString
        self.nationalityTxtVw.label.text = PlaceholderTexts.nationalIdNumber.localizedString
        
        self.referalCodeTxtVw.placeholder = PlaceholderTexts.enterReferalCode.localizedString
        self.referalCodeTxtVw.label.text = PlaceholderTexts.referalCode.localizedString
        
        self.expiryTxtVw.placeholder = PlaceholderTexts.expiryDate.localizedString
        self.expiryTxtVw.label.text = PlaceholderTexts.expiryDate.localizedString
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.nameTxtVw, self.emailTxtVw, self.dobTxtVw, self.genderTxtVw, self.nationalIdTxtVw, self.nationalityTxtVw, self.referalCodeTxtVw, self.expiryTxtVw])
    }
    
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editBtn_Action(_ sender: Any) {
        self.profileLbl.text = "Edit Profile"
        self.cameraVw.showD()
        self.verifyBtn.showD()
        self.updateVw.showD()
    }
    
    @IBAction func cameraBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func dobBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func genderBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func nationalityBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func verifyBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func expiryBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func updateBtn_Action(_ sender: Any) {
        self.profileLbl.text = "Profile"
        self.cameraVw.hideD()
        self.verifyBtn.hideD()
        self.updateVw.hideD()
    }
}
