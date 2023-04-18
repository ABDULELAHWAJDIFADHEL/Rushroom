//
//  HomeViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 22/02/23.
//

import Foundation
import UIKit

extension HomeViewC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.categorieCollectionVw {
            return 10
        }else{
            return TEN
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.categorieCollectionVw{
            return 0
        }else{
            return 24
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.categorieCollectionVw{
            return UIEdgeInsets(top: 0, left: 18, bottom: 0, right:  18)
        }else{
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: (21.4 * 10) + 24)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return ZERO
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.categorieCollectionVw{
            return CGSize(width: 144, height: 180)
        }else{
            return CGSize(width: 50, height: 80)
        }
    }
}

extension HomeViewC: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categorieCollectionVw{
            let cell = self.categorieCollectionVw.dequeueReusableCell(withReuseIdentifier: HomeCategorieCell.className, for: indexPath) as! HomeCategorieCell
            return cell
        }else{
            let cell = self.cityCollectionVw.dequeueReusableCell(withReuseIdentifier: HomeCityCell.className, for: indexPath) as! HomeCityCell
            return cell
        }
    }
}
