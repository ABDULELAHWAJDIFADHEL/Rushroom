//
//  HotelDetailViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 01/03/23.
//

import Foundation
import UIKit

extension HotelDetailViewC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.hotelCollectionVw.bounds.width / 6, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
}

extension HotelDetailViewC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.hotelCollectionVw.dequeueReusableCell(withReuseIdentifier: HotelCell.className, for: indexPath)as! HotelCell
        return cell
    }
}
