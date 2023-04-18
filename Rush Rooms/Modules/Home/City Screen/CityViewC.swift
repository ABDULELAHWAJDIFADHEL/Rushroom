//
//  CityViewC.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class CityViewC: UIViewController {

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var searchVw: UIView!
    @IBOutlet weak var cityTblVw: UITableView!{
        didSet{
            self.cityTblVw.delegate = self
            self.cityTblVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.registerXIB()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.searchVw, cornerRadius: FontSize.size_14.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    private func registerXIB(){
        self.cityTblVw.register(nib: CityCell.className)
    }
    
    @IBAction func crossBtn_Action(_ sender: Any) {
        self.dismiss(animated: true)
//        self.navigationController?.popViewController(animated: true)
    }
}
