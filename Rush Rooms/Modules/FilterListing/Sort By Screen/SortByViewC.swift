//
//  SortByViewC.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class SortByViewC: UIViewController {

    @IBOutlet weak var sortBottomVw, bottomVw: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.sortBottomVw, cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
