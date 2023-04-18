//
//  PaymentSuccessViewC.swift
//  Rush Rooms
//
//  Created by Kv on 03/03/23.
//

import UIKit

class PaymentSuccessViewC: UIViewController {

    @IBOutlet weak var backToHomeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.backToHomeBtn, cornerRadius: self.backToHomeBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    @IBAction func backToHomeBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Home, identifer: HomeViewC.className)
    }
}
