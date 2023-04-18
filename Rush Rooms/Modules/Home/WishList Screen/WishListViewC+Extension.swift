//
//  WishListViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 24/02/23.
//

import Foundation
import UIKit

extension WishListViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension WishListViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.wishListTblVw.dequeueReusableCell(withIdentifier: WishListCell.className)as! WishListCell
        cell.actualPriceLbl.attributedText = NsString.shared.makeSlashText("SAR 437.5", value: 2)
        return cell
    }
}
