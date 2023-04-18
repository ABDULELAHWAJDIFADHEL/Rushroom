//
//  BookingViewC.swift
//  Rush Rooms
//
//  Created by Kv on 24/02/23.
//

import UIKit

class BookingViewC: UIViewController {

    @IBOutlet weak var activeBtn, pendingBtn, cancelBtn, completeBtn: UIButton!
    @IBOutlet weak var activeVw, pendingVw, cancelVw, completeVw, filterVw: UIView!
    @IBOutlet weak var bookingLbl, filterLbl: UILabel!
    @IBOutlet weak var bookingTblVw: UITableView!{
        didSet{
            self.bookingTblVw.delegate = self
            self.bookingTblVw.dataSource = self
        }
    }
    
    var bookingStatus: String = KStrings.active.localizedString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
        self.setUpViews()
        self.setUpLanguage()
    }
    
    private func setUpLanguage(){
        self.activeBtn.setTitle(KStrings.active.localizedString, for: .normal)
        self.pendingBtn.setTitle(KStrings.pending.localizedString, for: .normal)
        self.cancelBtn.setTitle(KStrings.cancelled.localizedString, for: .normal)
        self.completeBtn.setTitle(KStrings.completed.localizedString, for: .normal)
    }
    
    private func setUpViews(){
        self.segmentSelection(selectedVw: self.activeVw, UnselectedView: [self.pendingVw, self.cancelVw, self.completeVw], selectedBtn: self.activeBtn, unselectedBtn: [self.pendingBtn, self.cancelBtn, self.completeBtn], bookingStatus: KStrings.active.localizedString)
        GlobalMethods.shared.provideCornerRadius(view: self.filterVw, cornerRadius: self.filterVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .OTPBACKGROUND_COLOR).cgColor, borderWidth: HALF)
    }
    
    private func registerXIB(){
        self.bookingTblVw.registerMultiple(nibs: [BookingActiveCell.className])
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func filterDropDownBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func completeBtn_Action(_ sender: Any) {
        self.segmentSelection(selectedVw: self.completeVw, UnselectedView: [self.pendingVw, self.cancelVw, self.activeVw], selectedBtn: self.completeBtn, unselectedBtn: [self.pendingBtn, self.cancelBtn, self.activeBtn], bookingStatus: KStrings.completed.localizedString)
    }
    
    @IBAction func cancelBtn_Action(_ sender: Any) {
        self.segmentSelection(selectedVw: self.cancelVw, UnselectedView: [self.pendingVw, self.activeVw, self.completeVw], selectedBtn: self.cancelBtn, unselectedBtn: [self.pendingBtn, self.activeBtn, self.completeBtn], bookingStatus: KStrings.cancelled.localizedString)
    }
    
    @IBAction func pendingBtn_Action(_ sender: Any) {
        self.segmentSelection(selectedVw: self.pendingVw, UnselectedView: [self.activeVw, self.cancelVw, self.completeVw], selectedBtn: self.pendingBtn, unselectedBtn: [self.activeBtn, self.cancelBtn, self.completeBtn], bookingStatus: KStrings.pending.localizedString)
    }
    
    @IBAction func activeBtn_Action(_ sender: Any) {
        self.segmentSelection(selectedVw: self.activeVw, UnselectedView: [self.pendingVw, self.cancelVw, self.completeVw], selectedBtn: self.activeBtn, unselectedBtn: [self.pendingBtn, self.cancelBtn, self.completeBtn], bookingStatus: KStrings.active.localizedString)
    }
}

extension BookingViewC{
    fileprivate func segmentSelection(selectedVw: UIView, UnselectedView: [UIView], selectedBtn: UIButton, unselectedBtn: [UIButton], bookingStatus: String){
        self.bookingStatus = bookingStatus
        selectedVw.backgroundColor = UIColor.black
        for view in UnselectedView {
            view.backgroundColor = UIColor.init(named: ColorCustomName.UltraLightCustomColor.rawValue)
        }
        selectedBtn.setTitleColor(UIColor.black, for: .normal)
        for button in unselectedBtn {
            button.setTitleColor(UIColor.init(named: ColorCustomName.LightBlueCustomColor.rawValue), for: .normal)
        }
        
        self.bookingTblVw.reloadData()
    }
}
