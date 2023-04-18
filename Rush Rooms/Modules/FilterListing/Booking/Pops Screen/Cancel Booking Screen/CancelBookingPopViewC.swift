//
//  CancelBookingPopViewC.swift
//  Rush Rooms
//
//  Created by Kv on 06/03/23.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class CancelBookingPopViewC: UIViewController {

    @IBOutlet weak var requestApprovedTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var confirmBtn, cancelBtn: UIButton!
    @IBOutlet weak var bottomVw: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpTextVw()
    }
    
    private func setUpTextVw(){
        self.requestApprovedTxtVw.placeholder = "Request not approved"
        self.requestApprovedTxtVw.label.text = "Select Reason"
        
        MaterialComponents.shared.ProvideMaterialData(vw: [self.requestApprovedTxtVw])
        
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.cancelBtn, cornerRadius: self.cancelBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.confirmBtn, cornerRadius: self.confirmBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_25.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    @IBAction func cancelBtn_Action(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func confirmBtn_Action(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
