//
//  WishListCell.swift
//  Rush Rooms
//
//  Created by Kv on 24/02/23.
//

import UIKit

class WishListCell: UITableViewCell {

    @IBOutlet weak var bottomDiscountVw: UIView!
    @IBOutlet weak var wishListImage: UIImageView!
    @IBOutlet weak var discountLbl, actualPriceLbl, offeredPriceLbl, hotelAddressLbl, reviewLbl, starLbl, hostNameLbl: UILabel!
    @IBOutlet weak var bottomVw, discountVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideCornerRadius(view: self.bottomVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.discountVw, cornerRadius: FontSize.size_8.rawValue, borderColor: UIColor.colorWith(hexString: .APP_WHITE).cgColor, borderWidth: HALF)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.discountVw, cornerRadius: FontSize.size_20.rawValue, cornerArray: [.layerMinXMinYCorner])
        GlobalMethods.shared.provideCornerRadius(view: self.bottomDiscountVw, cornerRadius: FontSize.size_4.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
}
