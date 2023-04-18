//
//  ChatLeftCell.swift
//  Rush Rooms
//
//  Created by Kv on 03/03/23.
//

import UIKit

class ChatLeftCell: UITableViewCell {

    @IBOutlet weak var leftMsgLbl, leftTimeLbl: UILabel!
    @IBOutlet weak var msgVw: UIView!
    @IBOutlet weak var hostImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideThreeCornerRadius(view: self.msgVw, cornerRadius: FontSize.size_22.rawValue, cornerArray: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner])
    }
}
