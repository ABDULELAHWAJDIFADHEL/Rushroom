//
//  SplashScreenViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 16/02/23.
//

import Foundation
import UIKit

extension SplashScreenViewC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.splashCollectionVw.bounds.width, height: self.splashCollectionVw.bounds.height)
    }
}

extension SplashScreenViewC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = splashCollectionVw.dequeueReusableCell(withReuseIdentifier: SplashCell.className, for: indexPath)as! SplashCell
        cell.splashImage.image = UIImage(named: splashImageArr[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if  scrollView == self.splashCollectionVw {
            let pageWidth:CGFloat = scrollView.frame.width
            let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
            self.segmentImageSet(currentPage: Int(currentPage))
            self.splashCollectionVw.reloadData()
        }
    }
}
