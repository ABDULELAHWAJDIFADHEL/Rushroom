//
//  SkipViewC.swift
//  Rush Rooms
//
//  Created by Kv on 05/04/23.
//

import UIKit

class SkipViewC: UIViewController {

    @IBOutlet weak var bottomVw: UIView!{
        didSet{
            GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_25.rawValue, cornerArray: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        }
    }
    @IBOutlet weak var loginStackVw: UIStackView!{
        didSet{
            GlobalMethods.shared.provideCornerRadius(view: self.loginStackVw, cornerRadius: FontSize.size_8.rawValue, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func loginBtn_Action(_ sender: Any) {
        Root.Login()
    }
    
    @IBAction func signUpBtn_Action(_ sender: Any) {
        Root.SignUp()
    }
    
}
