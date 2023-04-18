//
//  RoomFooterCell.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit

class RoomFooterCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var RoomFooterVw: UIView!
    @IBOutlet weak var addRoomBtn: UIButton!
    @IBOutlet weak var removeRoomBtn: UIButton!
    
    func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.addRoomBtn, cornerRadius: FontSize.size_4.rawValue, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.removeRoomBtn, cornerRadius: FontSize.size_4.rawValue, borderColor: UIColor.colorWith(hexString: .RED).cgColor, borderWidth: ONE)
    }
    
}
