//
//  ReviewViewC.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class ReviewViewC: UIViewController {

  
    @IBOutlet weak var txtVw: UITextView!
    @IBOutlet weak var uploadVw: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.sendBtn, cornerRadius: self.sendBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.txtVw, self.uploadVw], cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendBtn_Action(_ sender: Any) {
        Root.Home()
    }
    
    @IBAction func uploadBtn(_ sender: Any) {
        
    }
    
}
