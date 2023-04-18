//
//  NotificationViewC.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit
import DropDown

class NotificationViewC: UIViewController {

    @IBOutlet weak var dropDownEnglishVw, dropDownArabicVw: UIView!
    @IBOutlet weak var notiificationTitle: UILabel!
    @IBOutlet weak var notificationTblVw: UITableView!{
        didSet{
            self.notificationTblVw.delegate = self
            self.notificationTblVw.dataSource = self
        }
    }
    
    var dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.notificationTblVw.registerMultiple(nibs: [NotificationCell.className])
        self.notificationTblVw.register(UINib(nibName: NotificationHeaderCell.className, bundle: nil), forHeaderFooterViewReuseIdentifier: NotificationHeaderCell.className)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func threeDotBtn_Action(_ sender: Any) {
        let arr = [KStrings.muteNotification.localizedString, KStrings.clearAll.localizedString]
        if Localize.currentLanguage() == EN{
            self.dropDown.anchorView = dropDownEnglishVw
        }else{
            self.dropDown.anchorView = dropDownArabicVw
        }
        self.dropDown.backgroundColor = UIColor.white
        self.dropDown.dataSource = arr
        self.dropDown.show()
        self.dropDown.selectionAction = { (index: Int, item: String) in
            print("item")
        }
    }
    
}
