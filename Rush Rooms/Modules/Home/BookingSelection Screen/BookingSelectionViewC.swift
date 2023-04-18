//
//  BookingSelectionViewC.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit

class BookingSelectionViewC: UIViewController {
    @IBOutlet weak var customCheckBox: UIImageView!
    @IBOutlet weak var monthlyCheckBox: UIImageView!
    @IBOutlet weak var weeklyCheckBox: UIImageView!
    @IBOutlet weak var hourlyCheckBox: UIImageView!
    @IBOutlet weak var bookingSelectionLbl: UILabel!
    @IBOutlet weak var customVw: UIView!
    @IBOutlet weak var monthlyVw: UIView!
    @IBOutlet weak var weeklyVw: UIView!
    @IBOutlet weak var houtlyVw: UIView!
    @IBOutlet weak var bottomVw: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    var bookingStatus: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.continueBtn, cornerRadius: self.continueBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.houtlyVw, self.weeklyVw, self.monthlyVw, self.customVw], cornerRadius: FontSize.size_8.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_25.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    @IBAction func continueBtn_Action(_ sender: Any) {
        if self.bookingStatus == 3{
            let viewC = DIConfigurator.sharedInst().getDateSelectionViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        }else{
            let viewC = DIConfigurator.sharedInst().getAddGuestAndRoomViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
           
        }
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hourlyBtn_Action(_ sender: Any) {
        self.bookingStatus = 0
        self.checkBoxTick(checkedBox: self.hourlyCheckBox, uncheckBox: [self.weeklyCheckBox, self.monthlyCheckBox, self.customCheckBox])
    }
    
    @IBAction func weeklyBtn_Action(_ sender: Any) {
        self.bookingStatus = 1
        self.checkBoxTick(checkedBox: self.weeklyCheckBox, uncheckBox: [self.hourlyCheckBox, self.monthlyCheckBox, self.customCheckBox])
    }
    
    @IBAction func monthlyBtn_Action(_ sender: Any) {
        self.bookingStatus = 2
        self.checkBoxTick(checkedBox: self.monthlyCheckBox, uncheckBox: [self.weeklyCheckBox, self.hourlyCheckBox, self.customCheckBox])
    }
    
    @IBAction func customBtn_Action(_ sender: Any) {
        self.bookingStatus = 3
        self.checkBoxTick(checkedBox: self.customCheckBox, uncheckBox: [self.weeklyCheckBox, self.monthlyCheckBox, self.hourlyCheckBox])
    }
}

extension BookingSelectionViewC{
    
    fileprivate func checkBoxTick(checkedBox: UIImageView, uncheckBox: [UIImageView]){
        checkedBox.image = UIImage(named: AssestsImageName.circleFillCheckBox.rawValue)
        for box in uncheckBox {
            box.image = UIImage(named: AssestsImageName.CircleUnFilledCheckBox.rawValue)
        }
    }
}
