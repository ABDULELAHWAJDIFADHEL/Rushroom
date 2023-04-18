//
//  HomeViewC.swift
//  Rush Rooms
//
//  Created by Kv on 21/02/23.
//

import UIKit

class HomeViewC: UIViewController {
    
    @IBOutlet weak var nameLbl, homeSubTitle, settingLbl, chatLbl, bookingLbl, mapLbl, homeLbl, bannerTitleLbl, bannerSubTitleLbl, bookNowLbl, bannerDiscountLbl, discountLbl, exploreCityLbl, categorieLbl: UILabel!
    @IBOutlet weak var tabBarVw, favoriteVw, searchVw, bannerVw, bookNowVw, notificationVw: UIView!
    @IBOutlet weak var categorieSeeMoreBtn, citySeeMoreBtn: UIButton!
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cityCollectionVw: UICollectionView!{
        didSet{
            self.cityCollectionVw.delegate = self
            self.cityCollectionVw.dataSource = self
        }
    }
    @IBOutlet weak var categorieCollectionVw: UICollectionView!{
        didSet{
            self.categorieCollectionVw.delegate = self
            self.categorieCollectionVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.registerXIB()
        self.tabBarVw.addShapeHome()
    }
    
    
    private func registerXIB(){
        self.cityCollectionVw.registerNib(nib: HomeCityCell.className)
        self.categorieCollectionVw.registerNib(nib: HomeCategorieCell.className)
    }
    
    private func setUpViews(){
        self.navigationController?.isNavigationBarHidden = true
        GlobalMethods.shared.provideCornerRadius(view: self.profileImage, cornerRadius: self.profileImage.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.favoriteVw, self.notificationVw], cornerRadius: FontSize.size_12.rawValue, borderColor: UIColor.colorWith(hexString: .SHADOW_COLOR).cgColor, borderWidth: HALF)
        GlobalMethods.shared.provideCornerRadius(view: self.searchVw, cornerRadius: FontSize.size_12.rawValue, borderColor: UIColor.colorWith(hexString: .OTPBACKGROUND_COLOR).cgColor, borderWidth: HALF)
        GlobalMethods.shared.provideCornerRadius(view: self.bookNowVw, cornerRadius: self.bookNowVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.bannerVw, cornerRadius: FontSize.size_16.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        self.nameLbl.text = KStrings.hi.localizedString + (USER_DEFAULTS.string(forKey: UD.firstName) ?? EMPTY)
    }
    
    @IBAction func favoriteBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getWishListViewC()
        viewC.modalTransitionStyle = .crossDissolve
        viewC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(viewC, animated: true)
    }
    
    @IBAction func notificationBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getNotificationViewC()
        viewC.modalTransitionStyle = .crossDissolve
        viewC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(viewC, animated: true)
    }
    
    @IBAction func mapBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Map, identifer: MapViewC.className)
    }
    
    @IBAction func bookingBtn_Action(_ sender: Any) {
        if APPLICATION_TYPE == ApplicationTypeEnum.skip.rawValue{
            let viewC = DIConfigurator.sharedInst().getSkipViewC()
            viewC.modalTransitionStyle = .crossDissolve
            viewC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(viewC, animated: true)
        }else{
            let viewC = DIConfigurator.sharedInst().getBookingViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        }
    }
    
    @IBAction func chatBtn_Action(_ sender: Any) {
        if APPLICATION_TYPE == ApplicationTypeEnum.skip.rawValue{
            let viewC = DIConfigurator.sharedInst().getSkipViewC()
            viewC.modalTransitionStyle = .crossDissolve
            viewC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(viewC, animated: true)
        }else{
            DIConfigurator.sharedInst().getRootViewC(.Chat, identifer: ChatViewC.className)
        }
    }
    
    @IBAction func settingBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Setting, identifer: SideMenuViewC.className)
    }
    
    @IBAction func bookNowBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getReviewListViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func citySeeMoreBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getCityViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func categorieSeeMoreBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getCategorieViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func searchBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.navigationController?.navigationBar.alpha = 0
            self.navigationItem.titleView?.alpha = 0
            self.navigationItem.titleView?.frame.origin.y -= self.navigationController!.navigationBar.frame.size.height
            self.navigationItem.titleView?.layoutIfNeeded()
            self.navigationItem.rightBarButtonItem?.customView?.alpha = 0
            self.navigationItem.leftBarButtonItem?.customView?.alpha = 0
            self.navigationItem.leftBarButtonItem?.customView?.frame.origin.y -= self.navigationController!.navigationBar.frame.size.height
            self.navigationItem.rightBarButtonItem?.customView?.frame.origin.y -= self.navigationController!.navigationBar.frame.size.height
            self.navigationItem.rightBarButtonItem?.customView?.layoutIfNeeded()
            self.navigationItem.leftBarButtonItem?.customView?.layoutIfNeeded()
            self.navigationItem.searchController?.searchBar.frame.origin.y -= self.navigationController!.navigationBar.frame.size.height
            self.navigationItem.searchController?.searchBar.layoutIfNeeded()
        }) { (completed) in
            let viewC = DIConfigurator.sharedInst().getCityViewC()
            viewC.modalPresentationStyle = .fullScreen
            self.present(viewC, animated: false, completion: nil)
//            self.navigationController?.pushViewController(viewC, animated: true)
        }
    }
}
