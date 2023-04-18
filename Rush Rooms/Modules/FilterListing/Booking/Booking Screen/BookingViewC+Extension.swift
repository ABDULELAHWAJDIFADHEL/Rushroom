//
//  BookingViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 24/02/23.
//

import Foundation
import UIKit

extension BookingViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.bookingStatus == KStrings.active.localizedString {
            return 10
        }else{
            return 10
        }
    }
}

extension BookingViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.bookingTblVw.dequeueReusableCell(withIdentifier: BookingActiveCell.className)as! BookingActiveCell
        if self.bookingStatus == KStrings.active.localizedString {
            cell.checkInBtn.showD()
            cell.checkOutBtn.showD()
            cell.confirmBookingBtn.showD()
            cell.confirmBookingBtn.setTitle("Confirm Booking", for: .normal)
            cell.confirmBookingBtn.backgroundColor = UIColor.systemGreen
            return cell
        }else if self.bookingStatus == KStrings.pending.localizedString{
            cell.checkInBtn.hideD()
            cell.checkOutBtn.hideD()
            cell.confirmBookingBtn.showD()
            cell.confirmBookingBtn.setTitle(KStrings.pending.localizedString, for: .normal)
            cell.confirmBookingBtn.backgroundColor = UIColor.orange
            return cell
        }else if self.bookingStatus == KStrings.cancelled.localizedString{
            cell.checkInBtn.hideD()
            cell.checkOutBtn.hideD()
            cell.confirmBookingBtn.showD()
            cell.confirmBookingBtn.setTitle(KStrings.cancelled.localizedString, for: .normal)
            cell.confirmBookingBtn.backgroundColor = UIColor.red
            return cell
        }else{
            cell.checkInBtn.hideD()
            cell.checkOutBtn.hideD()
            cell.confirmBookingBtn.showD()
            cell.confirmBookingBtn.setTitle(KStrings.completed.localizedString, for: .normal)
            cell.confirmBookingBtn.backgroundColor = UIColor.systemGreen
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.bookingStatus == KStrings.active.localizedString {
            let viewC = DIConfigurator.sharedInst().getBookingHotelPendingViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        }else{
            let viewC = DIConfigurator.sharedInst().getBookingHotelDetailViewC()
            self.navigationController?.pushViewController(viewC, animated: true)
        }
    }
}
