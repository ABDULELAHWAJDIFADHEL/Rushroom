//
//  HotelBookingCell.swift
//  Rush Rooms
//
//  Created by Kv on 02/03/23.
//

import UIKit

class HotelBookingCell: UITableViewCell {

    @IBOutlet weak var dropDownBtn: UIButton!
    @IBOutlet weak var childVw: UIView!
    @IBOutlet weak var adultVw: UIView!
    @IBOutlet weak var bottomVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.childVw, self.adultVw, self.bottomVw], cornerRadius: FontSize.size_6.rawValue, borderColor: UIColor.colorWith(hexString: .SHADOW_COLOR).cgColor, borderWidth: HALF)
    }
}
