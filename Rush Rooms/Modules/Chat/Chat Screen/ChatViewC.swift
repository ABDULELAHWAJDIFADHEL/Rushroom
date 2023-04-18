//
//  ChatViewC.swift
//  Rush Rooms
//
//  Created by Kv on 22/02/23.
//

import UIKit

class ChatViewC: UIViewController {

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var notificationVw, searchVw, tabBarVw: UIView!
    @IBOutlet weak var chatNavigationTitleLbl, mapLbl, booking, chatLbl, settingLbl, homeLbl: UILabel!
    @IBOutlet weak var chatTblVw: UITableView!{
        didSet{
            self.chatTblVw.delegate = self
            self.chatTblVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.registerXIB()
    }
    
    private func setUpViews(){
        tabBarVw.addShapeHome()
        self.navigationController?.isNavigationBarHidden = true
        GlobalMethods.shared.provideCornerRadius(view: self.notificationVw, cornerRadius: FontSize.size_12.rawValue, borderColor: UIColor.colorWith(hexString: .SHADOW_COLOR).cgColor, borderWidth: HALF)
        GlobalMethods.shared.provideCornerRadius(view: self.searchVw, cornerRadius: FontSize.size_12.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
    
    private func registerXIB(){
        self.chatTblVw.register(nib: ChatCell.className)
    }
    
    @IBAction func homeBtn_Action(_ sender: Any) {
        Root.Home()
    }
    
    @IBAction func notificationBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getNotificationViewC()
        viewC.modalTransitionStyle = .crossDissolve
        viewC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(viewC, animated: true)
    }
    
    @IBAction func settingBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Setting, identifer: SideMenuViewC.className)
    }
    
    @IBAction func bookingBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getBookingViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func mapBtn_Action(_ sender: Any) {
        DIConfigurator.sharedInst().getRootViewC(.Map, identifer: MapViewC.className)
    }
}
