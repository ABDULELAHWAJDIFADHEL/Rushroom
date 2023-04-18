//
//  RoomCell.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var lineVw: UIView!
    @IBOutlet weak var roomVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideThreeCornerRadius(view: self.roomVw, cornerRadius: FontSize.size_6.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
}
