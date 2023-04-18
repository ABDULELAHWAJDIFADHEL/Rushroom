//
//  MapViewC.swift
//  Rush Rooms
//
//  Created by Kv on 03/03/23.
//

import UIKit

class MapViewC: UIViewController {

    @IBOutlet weak var home, settingLbl, bookingLbl, chatLbl: UILabel!
    @IBOutlet weak var tabBarVw, searchVw, bottomVw, mapBottomVw, resturantVw, discountVw: UIView!
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var mapCollectionVw: UICollectionView!{
        didSet{
            self.mapCollectionVw.delegate = self
            self.mapCollectionVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.registerXIB()
    }
    
    private func setUpView(){
        self.bottomVw.hideD()
        self.tabBarVw.addShapeHome()
        self.navigationController?.isNavigationBarHidden = true
        GlobalMethods.shared.provideCornerRadius(view: self.searchVw, cornerRadius: self.searchVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideThreeCornerRadius(view: self.mapBottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideThreeCornerRadius(view: self.discountVw, cornerRadius: FontSize.size_12.rawValue, cornerArray: [.layerMinXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.resturantVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        
    }
    
    private func registerXIB(){
        self.mapCollectionVw.registerNib(nib: MapCell.className)
    }
    
    @IBAction func currentLocationBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func homeBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Home, identifer: HomeViewC.className)
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
    
    @IBAction func filterBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func heartBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func mapIconBtn_Action(_ sender: Any) {
        self.bottomVw.showD()
    }
    
    @IBAction func hideBtn_Action(_ sender: Any) {
        self.bottomVw.hideD()
    }
}
