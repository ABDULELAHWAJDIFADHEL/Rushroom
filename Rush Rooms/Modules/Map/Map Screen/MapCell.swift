//
//  MapCell.swift
//  Rush Rooms
//
//  Created by Kv on 03/03/23.
//

import UIKit

class MapCell: UICollectionViewCell {

    @IBOutlet weak var rateBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideCornerRadius(view: self.rateBtn, cornerRadius: FontSize.size_15.rawValue, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
    }
}
