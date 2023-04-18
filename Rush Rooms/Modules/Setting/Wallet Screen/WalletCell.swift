//
//  WalletCell.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class WalletCell: UITableViewCell {

    @IBOutlet weak var walletImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideCornerRadius(view: self.walletImage, cornerRadius: FontSize.size_12.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
}
