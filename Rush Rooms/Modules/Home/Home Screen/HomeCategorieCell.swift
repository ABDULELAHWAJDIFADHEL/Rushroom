//
//  HomeCategorieCell.swift
//  Rush Rooms
//
//  Created by Kv on 22/02/23.
//

import UIKit

class HomeCategorieCell: UICollectionViewCell {

    @IBOutlet weak var bottomVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideShadow1(view: self.bottomVw, shadowColor: UIColor.colorWith(hexString: .CUSTOM_BACKGROUND_COLOR).cgColor, shadowOpacity: 0.5, shadowOffset: CGSize(width: 0.1, height: 0.1), shadowRadius: FontSize.size_20.rawValue)
    }
}
