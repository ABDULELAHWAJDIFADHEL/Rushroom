//
//  AddGuestAndRoomViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import Foundation
import UIKit

extension AddGuestAndRoomViewC: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return INTONE
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomCount.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension AddGuestAndRoomViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = self.addGuestRoomTblVw.dequeueReusableHeaderFooterView(withIdentifier: RoomFooterCell.className)as! RoomFooterCell
        footer.addRoomBtn.addTarget(self, action: #selector(addRoomBtnTap), for: .touchUpInside)
        footer.removeRoomBtn.addTarget(self, action: #selector(removeRoomBtnTap), for: .touchUpInside)
        if roomCount.count == 0{
            GlobalMethods.shared.provideCornerRadius(view: footer.RoomFooterVw, cornerRadius: FontSize.size_6.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        }else{
            GlobalMethods.shared.provideThreeCornerRadius(view: footer.RoomFooterVw, cornerRadius: FontSize.size_6.rawValue, cornerArray: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        }
        footer.setUpView()
        return footer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.addGuestRoomTblVw.dequeueReusableCell(withIdentifier: RoomCell.className)as! RoomCell
        if roomCount.count == indexPath.row + 1{
            cell.lineVw.hideD()
        }else{
            cell.lineVw.showD()
        }
        return cell
    }
}
