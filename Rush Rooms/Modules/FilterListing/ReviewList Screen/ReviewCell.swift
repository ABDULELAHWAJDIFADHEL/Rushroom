//
//  ReviewCell.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var bottomVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
}
