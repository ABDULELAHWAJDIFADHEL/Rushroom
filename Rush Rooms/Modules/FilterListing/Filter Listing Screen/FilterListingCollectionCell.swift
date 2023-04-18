//
//  FilterListingCollectionCell.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class FilterListingCollectionCell: UICollectionViewCell {

    @IBOutlet weak var filterBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GlobalMethods.shared.provideCornerRadius(view: self.filterBtn, cornerRadius: self.filterBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
    }
}
