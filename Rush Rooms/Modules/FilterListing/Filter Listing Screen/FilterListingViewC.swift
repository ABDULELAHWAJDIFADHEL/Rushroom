//
//  FilterListingViewC.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class FilterListingViewC: UIViewController {

    @IBOutlet weak var destinationTxtVw, guestAndRoomTxtVw, checkInTxtVw, checkOutTxtVw: UIView!
    @IBOutlet weak var categorieName, dateLbl, guestLbl: UILabel!
    @IBOutlet weak var mapBtn, updateSearchBtn, editBtn: UIButton!
    @IBOutlet weak var editVw: UIView!
    @IBOutlet weak var filterCollectionVw: UICollectionView!{
        didSet{
            self.filterCollectionVw.delegate = self
            self.filterCollectionVw.dataSource = self
        }
    }
    @IBOutlet weak var filterTblVw: UITableView!{
        didSet{
            self.filterTblVw.delegate = self
            self.filterTblVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.filterTblVw.register(nib: WishListCell.className)
        self.filterCollectionVw.registerNib(nib: FilterListingCollectionCell.className)
    }
    
    private func setUpView(){
        self.editVw.hideD()
        GlobalMethods.shared.provideCornerRadius(view: self.mapBtn, cornerRadius: self.mapBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.updateSearchBtn, cornerRadius: self.updateSearchBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.editBtn, cornerRadius: FontSize.size_3.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.destinationTxtVw, self.guestAndRoomTxtVw, self.checkInTxtVw, self.checkOutTxtVw], cornerRadius: FontSize.size_6.rawValue, borderColor: UIColor.colorWith(hexString: .OTPBACKGROUND_COLOR).cgColor, borderWidth: ONE)
    }
    
    @IBAction func mapBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Map, identifer: MapViewC.className)
    }
    
    @IBAction func homeBtn_Action(_ sender: Any) {
        Root.Home()
    }
    
    @IBAction func filterBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getFilterViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func updateSearchBtn_Action(_ sender: Any) {
        self.editVw.hideD()
    }
    
    @IBAction func editBtn_Action(_ sender: Any) {
        self.editVw.showD()
    }
    
    @IBAction func destinationBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func checkInBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func checkOutBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func guestRoomBtn_Action(_ sender: Any) {
        
    }
    
    @objc func filterBtnTap(_ sender: UIButton){
        if sender.tag == 0{
            let viewC = DIConfigurator.sharedInst().getDirectionViewC()
            viewC.modalTransitionStyle = .crossDissolve
            viewC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(viewC, animated: true)
        }else{
            let viewC = DIConfigurator.sharedInst().getSortByViewC()
            viewC.modalTransitionStyle = .crossDissolve
            viewC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(viewC, animated: true)
        }
    }
}
