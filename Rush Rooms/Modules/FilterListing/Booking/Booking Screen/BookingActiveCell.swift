//
//  BookingActiveCell.swift
//  Rush Rooms
//
//  Created by Kv on 24/02/23.
//

import UIKit

class BookingActiveCell: UITableViewCell {

    @IBOutlet weak var checkInBtn, checkOutBtn, confirmBookingBtn: UIButton!
    @IBOutlet weak var bottomVw, dateVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.checkInBtn, self.checkOutBtn], cornerRadius: FontSize.size_10.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadiusMultipleView(vw: [self.confirmBookingBtn, self.dateVw], cornerRadius: FontSize.size_6.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        
    }
}
