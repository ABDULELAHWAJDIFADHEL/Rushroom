//
//  HotelBookingViewC.swift
//  Rush Rooms
//
//  Created by Kv on 02/03/23.
//

import UIKit

class HotelBookingViewC: UIViewController {

    @IBOutlet weak var bottomVw, hotelBottomVw, checkInDateVw, checkOutDateVw, checkInTimeVw, checkOutTimeVw, roomVw, emailVw, phoneNoVw, promoCodeVw, bookingVw: UIView!
    @IBOutlet weak var hotelHeight: NSLayoutConstraint!
    @IBOutlet weak var paymentBtn: UIButton!
    @IBOutlet weak var hotelTblVw: UITableView!{
        didSet{
            self.hotelTblVw.delegate = self
            self.hotelTblVw.dataSource = self
        }
    }
    
    var bargainStatus: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.hotelHeight.constant = 250 * 2
        self.hotelTblVw.register(nib: HotelBookingCell.className)
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.checkInDateVw, self.checkInTimeVw, self.checkOutDateVw, self.checkOutTimeVw, self.roomVw, self.emailVw, self.phoneNoVw, self.promoCodeVw], cornerRadius: FontSize.size_4.rawValue, borderColor: UIColor.colorWith(hexString: .SHADOW_COLOR).cgColor, borderWidth: HALF)
        GlobalMethods.shared.provideCornerRadius(view: self.bookingVw, cornerRadius: FontSize.size_15.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.paymentBtn, cornerRadius: self.paymentBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.hotelBottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_25.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func paymentBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getPaymentSuccessViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
