//
//  VerifyViewC.swift
//  Rush Rooms
//
//  Created by Kv on 17/02/23.
//

import UIKit

class VerifyViewC: UIViewController {

    @IBOutlet weak var verifySubTitleLbl: UILabel!
    @IBOutlet weak var verifyTitleLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    var comeFromSignUp: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.setUpLanguage()
    }
    
    private func setUpViews(){
        GlobalMethods.shared.provideCornerRadius(view: self.loginBtn, cornerRadius: self.loginBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    private func setUpLanguage(){
        guard self.comeFromSignUp else{
            self.verifySubTitleLbl.text = KStrings.verifyFromChangePassword.localizedString
            self.loginBtn.setTitle(KStrings.back.localizedString, for: .normal)
            return
        }
        self.verifyTitleLbl.text = KStrings.verifyTitle.localizedString
        self.verifySubTitleLbl.text = KStrings.verifySubTitle.localizedString
        self.loginBtn.setTitle(KStrings.loginAgain.localizedString, for: .normal)
    }
    
    @IBAction func loginBtn_Action(_ sender: Any) {
        guard self.comeFromSignUp else{
            DIConfigurator.sharedInst().getRootViewC(.Setting, identifer: SideMenuViewC.className)
            return
        }
        let viewC = DIConfigurator.sharedInst().getWelcomeScreenViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
