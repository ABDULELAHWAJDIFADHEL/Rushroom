//
//  SideMenuViewC.swift
//  Rush Rooms
//
//  Created by Kv on 22/02/23.
//

import UIKit

class SideMenuViewC: UIViewController {

    @IBOutlet weak var mapLbl: UILabel!
    @IBOutlet weak var settingLbl: UILabel!
    @IBOutlet weak var chatLbl: UILabel!
    @IBOutlet weak var bookingLbl: UILabel!
    @IBOutlet weak var discoverLbl: UILabel!
    @IBOutlet weak var tabBarVw: UIView!
    @IBOutlet weak var nameLbl, emailLbl, profileNavigationTitleLbl, accoundSettingLbl, logOutLbl, faqLbl, privacyLbl, termLbl, rateLbl, contactLbl, supportLbl, propertyListLbl, propertyListTitleLbl, inviteLbl, paymentLbl, languageLbl, languageTxtLbl, notificationLbl, notificationTitleLbl, walletLbl, changePasswordLbl: UILabel!
    @IBOutlet weak var bottomVw, sideMenuBottomVw: UIView!
    @IBOutlet weak var profileImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
    }
    
    private func setUpViews(){
        self.tabBarVw.addShapeHome()
        self.navigationController?.isNavigationBarHidden = true
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        GlobalMethods.shared.provideThreeCornerRadius(view: self.sideMenuBottomVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        
        switch APPLICATION_TYPE{
        case ApplicationTypeEnum.skip.rawValue:
            self.nameLbl.text = "GUEST USER"
            self.emailLbl.text = "EMAIL"
        default:
            self.nameLbl.text = (USER_DEFAULTS.string(forKey: UD.firstName) ?? EMPTY) + EMPTY_SPACE + (USER_DEFAULTS.string(forKey: UD.lastName) ?? EMPTY)
            self.emailLbl.text = USER_DEFAULTS.string(forKey: UD.email) ?? EMPTY
        }
       
    }

    @IBAction func profileBtn_Action(_ sender: Any) {
        if APPLICATION_TYPE == ApplicationTypeEnum.skip.rawValue{
            let viewC = DIConfigurator.sharedInst().getSkipViewC()
            viewC.modalTransitionStyle = .crossDissolve
            viewC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(viewC, animated: true)
        }else{
            let viewC = DIConfigurator.sharedInst().getProfileViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        }
    }
    
    @IBAction func walletBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getWalletViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func notificationBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func languageBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func paymentBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func inviteBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getInviteFriendViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func propertyListBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func contactBtn_Action(_ sender: Any) {
        self.showToast(message: "Contact")
    }
    
    @IBAction func rateBtn_Action(_ sender: Any) {
        self.showToast(message: "Rate")
    }

    @IBAction func termConditionBtn_Action(_ sender: Any) {
        self.showToast(message: "Term")
    }
    
    @IBAction func privacyBtn_Action(_ sender: Any) {
        self.showToast(message: "Privacy")
    }
    
    @IBAction func faqBtn_Action(_ sender: Any) {
        self.showToast(message: "FAQ")
    }
    
    @IBAction func changePasswordBtn_Action(_ sender: Any) {
        if APPLICATION_TYPE == ApplicationTypeEnum.skip.rawValue{
            let viewC = DIConfigurator.sharedInst().getSkipViewC()
            viewC.modalTransitionStyle = .crossDissolve
            viewC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(viewC, animated: true)
        }else{
            let viewC = DIConfigurator.sharedInst().getChangePasswordViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        }
    }
    
    @IBAction func logOutBtn_Action(_ sender: Any) {
        USER_DEFAULTS.removeObject(forKey: UD.jwtToken)
        Root.Login()
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
    
    @IBAction func homeBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Home, identifer: HomeViewC.className)
    }
    
    @IBAction func mapBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Map, identifer: MapViewC.className)
    }
}
