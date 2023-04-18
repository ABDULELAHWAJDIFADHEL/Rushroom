//
//  HotelBookingViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 02/03/23.
//

import Foundation
import UIKit

extension HotelBookingViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}

extension HotelBookingViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.hotelTblVw.dequeueReusableCell(withIdentifier: HotelBookingCell.className)as! HotelBookingCell
        
        return cell
    }
}
