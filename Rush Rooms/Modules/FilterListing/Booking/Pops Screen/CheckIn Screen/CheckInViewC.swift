//
//  CheckInViewC.swift
//  Rush Rooms
//
//  Created by Kv on 06/03/23.
//

import UIKit

class CheckInViewC: UIViewController {

    @IBOutlet weak var checkInBtn: UIButton!
    @IBOutlet weak var bottomVw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_25.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.checkInBtn, cornerRadius: self.checkInBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    @IBAction func checkInBtn_Action(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
