//
//  BookingHotelPendingViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 06/03/23.
//

import Foundation
import UIKit

extension BookingHotelPendingViewC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0{
            self.navigationVw.showD()
            self.backBtn.hideD()
            self.favBtn.hideD()
            UIView.animate(withDuration: 4) {
                self.view.layoutIfNeeded()
            }
        }else{
            self.navigationVw.hideD()
            self.backBtn.showD()
            self.favBtn.showD()
            UIView.animate(withDuration: 4) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
