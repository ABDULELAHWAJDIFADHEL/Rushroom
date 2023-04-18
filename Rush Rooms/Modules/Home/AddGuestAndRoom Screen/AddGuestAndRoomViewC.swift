//
//  AddGuestAndRoomViewC.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit

class AddGuestAndRoomViewC: UIViewController {
    
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var bottomVw: UIView!
    @IBOutlet weak var addGuestLbl: UILabel!
    @IBOutlet weak var addGuestRoomTblVw: UITableView!{
        didSet{
            self.addGuestRoomTblVw.delegate = self
            self.addGuestRoomTblVw.dataSource = self
        }
    }
    
    var roomCount = [Int]()
    var i: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.addGuestRoomTblVw.register(nib: RoomCell.className)
        self.addGuestRoomTblVw.register(UINib(nibName: RoomFooterCell.className, bundle: nil), forHeaderFooterViewReuseIdentifier: RoomFooterCell.className)
    }
    
    private func setUpViews(){
        i = 1
        roomCount.append(i)
        GlobalMethods.shared.provideCornerRadius(view: self.continueBtn, cornerRadius: self.continueBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_25.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getFilterListingViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @objc func addRoomBtnTap(_ sender: UIButton){
        i += 1
        self.roomCount.append(i)
        self.addGuestRoomTblVw.reloadData()
    }
    
    @objc func removeRoomBtnTap(_ sender: UIButton){
        if roomCount.count > 0{
            roomCount.remove(at: 0)
        }else{
            i = 1
        }
        self.addGuestRoomTblVw.reloadData()
    }
}
