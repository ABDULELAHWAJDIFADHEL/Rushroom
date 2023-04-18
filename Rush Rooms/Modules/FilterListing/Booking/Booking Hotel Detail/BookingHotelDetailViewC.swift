//
//  BookingHotelDetailViewC.swift
//  Rush Rooms
//
//  Created by Kv on 02/03/23.
//

import UIKit

class BookingHotelDetailViewC: UIViewController {

    @IBOutlet weak var navigationVw, bookingBottomVw, bottomDiscountVw, bottomSubDiscountVw, checkInDateVw, checkOutDateVw, checkInTimeVw, checkOutTimeVw, roomGuestVw, locationVw, emailVw, hostVw, phoneVw, foodDrinkVw, houseVw, houseRuleVw: UIView!
    @IBOutlet weak var foodDrinkStackVw, houseStackVw, houseRuleStackVw: UIStackView!
    @IBOutlet weak var cancelBookingBtn, backBtn, favBtn, writeReviewBtn, completeBtn: UIButton!
    @IBOutlet weak var scrollVw: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView(){
        self.navigationVw.hideD()
        self.scrollVw.delegate = self
        self.houseVw.hideD()
        self.houseRuleVw.hideD()
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.checkInDateVw, self.checkInTimeVw, self.checkOutDateVw, self.checkOutTimeVw, self.roomGuestVw, self.emailVw, self.phoneVw], cornerRadius: FontSize.size_4.rawValue, borderColor: UIColor.colorWith(hexString: .SHADOW_COLOR).cgColor, borderWidth: HALF)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bookingBottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.cancelBookingBtn, cornerRadius: self.cancelBookingBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.hostVw, cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.foodDrinkStackVw, self.houseStackVw, self.houseRuleStackVw, self.locationVw], cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.bottomDiscountVw, cornerRadius: FontSize.size_6.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomSubDiscountVw, cornerRadius: FontSize.size_18.rawValue, cornerArray: [.layerMinXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.writeReviewBtn, cornerRadius: self.bottomSubDiscountVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.completeBtn, cornerRadius: FontSize.size_4.rawValue , borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    @IBAction func navigationBackBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func cancelBookingBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getCancelBookingPopViewC()
        viewC.modalTransitionStyle = .crossDissolve
        viewC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(viewC, animated: true)
    }
    @IBAction func writeReviewBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getReviewListViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func houseRuleBtn_Action(_ sender: Any) {
        if self.houseRuleVw.isHidden == true{
            self.houseRuleVw.showD()
        }else{
            self.houseRuleVw.hideD()
        }
    }
    
    @IBAction func houseServiceBtn(_ sender: Any) {
        if self.houseVw.isHidden == true{
            self.houseVw.showD()
        }else{
            self.houseVw.hideD()
        }
    }
    
    @IBAction func foodBtn_Action(_ sender: Any) {
        if self.foodDrinkVw.isHidden == true{
            self.foodDrinkVw.showD()
        }else{
            self.foodDrinkVw.hideD()
        }
    }
    
    
    
    
}
