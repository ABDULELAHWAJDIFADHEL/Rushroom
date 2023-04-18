//
//  ChatCell.swift
//  Rush Rooms
//
//  Created by Kv on 22/02/23.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var onlineImage: UIImageView!
    @IBOutlet weak var count, timeLbl, msgLbl, chatNamelbl: UILabel!
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var countVw: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideCornerRadius(view: self.countVw, cornerRadius: self.countVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
//        GlobalMethods.shared.provideCornerRadius(view: self.chatImage, cornerRadius: FontSize.size_3.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
}
