//
//  HotelDetailViewC.swift
//  Rush Rooms
//
//  Created by Kv on 01/03/23.
//

import UIKit

class HotelDetailViewC: UIViewController {

    @IBOutlet weak var reviewVw: UIView!
    @IBOutlet weak var scrolVw: UIScrollView!
    @IBOutlet weak var foodStackVw, houseStackVw, houseRuleStackVw: UIStackView!
    @IBOutlet weak var hotelVw, bottomVw, locationVw, hostVw, foodVw, houseServiceVw, houseRulesVw, bottomDiscountVwe, subBottomDiscountVw, navigationVw: UIView!
    @IBOutlet weak var bookBtn, contactBtn, backBtnn, favBtb: UIButton!
    @IBOutlet weak var hotelCollectionVw: UICollectionView!{
        didSet{
            self.hotelCollectionVw.delegate = self
            self.hotelCollectionVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.hotelCollectionVw.registerNib(nib: HotelCell.className)
    }
    
    private func setUpView(){
        self.navigationVw.hideD()
        self.scrolVw.delegate = self
        self.houseServiceVw.hideD()
        self.houseRulesVw.hideD()
        GlobalMethods.shared.provideThreeCornerRadius(view: self.hotelVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_25.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.bookBtn, cornerRadius: self.bookBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.hostVw, cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.foodStackVw, self.houseStackVw, self.houseRuleStackVw, self.locationVw], cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.contactBtn], cornerRadius: self.contactBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.bottomDiscountVwe, cornerRadius: FontSize.size_6.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.subBottomDiscountVw, cornerRadius: FontSize.size_18.rawValue, cornerArray: [.layerMinXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.reviewVw, cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bookBtn_Action(_ sender: Any) {
        if APPLICATION_TYPE == ApplicationTypeEnum.skip.rawValue{
            let viewC = DIConfigurator.sharedInst().getSkipViewC()
            viewC.modalTransitionStyle = .crossDissolve
            viewC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(viewC, animated: true)
        }else{
            let viewC = DIConfigurator.sharedInst().getHotelBookingViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        }
    }
    @IBAction func foodBtn_Action(_ sender: Any) {
        if self.foodVw.isHidden == true{
            self.foodVw.showD()
        }else{
            self.foodVw.hideD()
        }
    }
    
    @IBAction func houseRuleBtn_Action(_ sender: Any) {
        if self.houseRulesVw.isHidden == true{
            self.houseRulesVw.showD()
        }else{
            self.houseRulesVw.hideD()
        }
    }
    
    @IBAction func houseServiceBtn_Action(_ sender: Any) {
        if self.houseServiceVw.isHidden == true{
            self.houseServiceVw.showD()
        }else{
            self.houseServiceVw.hideD()
        }
    }
    
    @IBAction func back1Btn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func seeAllReviewBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getReviewListViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
}

extension HotelDetailViewC : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0{
            self.navigationVw.showD()
            self.backBtnn.hideD()
            self.favBtb.hideD()
            UIView.animate(withDuration: 4) {
                self.view.layoutIfNeeded()
            }
        }else{
            self.navigationVw.hideD()
            self.backBtnn.showD()
            self.favBtb.showD()
            UIView.animate(withDuration: 4) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
