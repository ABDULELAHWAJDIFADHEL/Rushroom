//
//  FilterViewC.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class FilterViewC: UIViewController {

    
    @IBOutlet weak var filterTitleLbl: UILabel!
    @IBOutlet weak var applyBtn, clearFilterBtn: UIButton!
    @IBOutlet weak var bottomVw: UIView!
    @IBOutlet weak var filterTblVw: UITableView!{
        didSet{
            self.filterTblVw.delegate = self
            self.filterTblVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
        self.setUpView()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_25.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.applyBtn, cornerRadius: self.applyBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    private func registerXIB(){
        self.filterTblVw.register(UINib(nibName: FilterHeaderCell.className, bundle: nil), forHeaderFooterViewReuseIdentifier: FilterHeaderCell.className)
        self.filterTblVw.register(UINib(nibName: NotificationHeaderCell.className, bundle: nil), forHeaderFooterViewReuseIdentifier: NotificationHeaderCell.className)
        self.filterTblVw.register(UINib(nibName: FilterFooterCell.className, bundle: nil), forHeaderFooterViewReuseIdentifier: FilterFooterCell.className)
        self.filterTblVw.registerMultiple(nibs: [FilterCell.className, PriceRangeCell.className, RatingCell.className, RoomsAndBedCell.className])
    }
    
    @IBAction func crossBackBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearFilterBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func applyBtn_Action(_ sender: Any) {
        
    }
}
