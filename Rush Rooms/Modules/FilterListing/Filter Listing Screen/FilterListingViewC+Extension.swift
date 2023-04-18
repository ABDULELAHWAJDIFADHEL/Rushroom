//
//  FilterListingViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import Foundation
import UIKit

extension FilterListingViewC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: (10 * 4) + 24)
    }
}

extension FilterListingViewC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.filterCollectionVw.dequeueReusableCell(withReuseIdentifier: FilterListingCollectionCell.className, for: indexPath)as! FilterListingCollectionCell
        cell.filterBtn.tag = indexPath.row
        cell.filterBtn.addTarget(self, action: #selector(filterBtnTap), for: .touchUpInside)
        return cell
    }
}

extension FilterListingViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

extension FilterListingViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.filterTblVw.dequeueReusableCell(withIdentifier: WishListCell.className)as! WishListCell
        cell.actualPriceLbl.attributedText = NsString.shared.makeSlashText("SAR 437.5", value: 2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewC = DIConfigurator.sharedInst().getHotelDetailViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
