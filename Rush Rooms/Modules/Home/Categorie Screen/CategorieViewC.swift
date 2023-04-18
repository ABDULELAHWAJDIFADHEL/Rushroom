//
//  CategorieViewC.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit

class CategorieViewC: UIViewController {

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var bottomVw, searchVw: UIView!
    @IBOutlet weak var categorieLbl: UILabel!
    @IBOutlet weak var categorieTblVw: UITableView!{
        didSet{
            self.categorieTblVw.delegate = self
            self.categorieTblVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.categorieTblVw.register(nib: CategorieCell.className)
    }
    
    private func setUpViews(){
        GlobalMethods.shared.provideCornerRadius(view: self.continueBtn, cornerRadius: self.continueBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.searchVw, cornerRadius: FontSize.size_12.rawValue, borderColor: UIColor.colorWith(hexString: .OTPBACKGROUND_COLOR).cgColor, borderWidth: HALF)
        
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getBookingSelectionViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
