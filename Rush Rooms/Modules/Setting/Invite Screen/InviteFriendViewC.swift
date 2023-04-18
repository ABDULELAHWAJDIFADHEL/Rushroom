//
//  InviteFriendViewC.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class InviteFriendViewC: UIViewController {

    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var shareTxtVw: MDCOutlinedTextField!
    @IBOutlet weak var inviteFriendLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTextVw()
        self.setUpView()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.shareBtn, cornerRadius: self.shareBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    private func setUpTextVw(){
        self.shareTxtVw.placeholder = PlaceholderTexts.referalCode.localizedString
        self.shareTxtVw.label.text = PlaceholderTexts.referalCode.localizedString
    
        MaterialComponents.shared.ProvideMaterialData(vw: [self.shareTxtVw])
        self.shareTxtVw.text = "ABC1457FGH"
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func copyBtn_Action(_ sender: Any) {
        
    }
    
}
