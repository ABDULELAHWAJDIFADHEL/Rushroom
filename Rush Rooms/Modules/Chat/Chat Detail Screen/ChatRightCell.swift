//
//  ChatRightCell.swift
//  Rush Rooms
//
//  Created by Kv on 03/03/23.
//

import UIKit

class ChatRightCell: UITableViewCell {

    @IBOutlet weak var rightTimeLbl, rightMsgLbl: UILabel!
    @IBOutlet weak var msgVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideThreeCornerRadius(view: self.msgVw, cornerRadius: FontSize.size_22.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner])
    }
}
