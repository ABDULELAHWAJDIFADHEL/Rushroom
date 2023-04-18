//
//  WalletViewC.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class WalletViewC: UIViewController {

    @IBOutlet weak var walletTiltleLbl, totalBalanceLbl, balanceLbl, transitionDetailLbl: UILabel!
    @IBOutlet weak var addMoneyBtn: UIButton!
    @IBOutlet weak var totalBalanceVw: UIView!
    @IBOutlet weak var walletTblVw: UITableView!{
        didSet{
            self.walletTblVw.delegate = self
            self.walletTblVw.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.walletTblVw.register(nib: WalletCell.className)
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.addMoneyBtn, cornerRadius: self.addMoneyBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.totalBalanceVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addMoneyBtn_Action(_ sender: Any) {
        
    }
}
