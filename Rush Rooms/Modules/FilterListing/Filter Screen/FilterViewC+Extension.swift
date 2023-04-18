//
//  FilterViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 01/03/23.
//

import Foundation
import UIKit

extension FilterViewC: UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 3
        case 1:
            return 8
        case 2:
            return 1
        case 3:
            return 5
        case 4:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1{
            return UITableView.automaticDimension
        }else{
           return 0
        }
    }
}

extension FilterViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 || section == 2{
            let header = self.filterTblVw.dequeueReusableHeaderFooterView(withIdentifier: NotificationHeaderCell.className)as! NotificationHeaderCell
            return header
        }else{
            let header = self.filterTblVw.dequeueReusableHeaderFooterView(withIdentifier: FilterHeaderCell.className)as! FilterHeaderCell
            GlobalMethods.shared.provideThreeCornerRadius(view: header.headerVw, cornerRadius: FontSize.size_10.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1{
            let footer = self.filterTblVw.dequeueReusableHeaderFooterView(withIdentifier: FilterFooterCell.className)as! FilterFooterCell
            GlobalMethods.shared.provideThreeCornerRadius(view: footer.fotterVw, cornerRadius: FontSize.size_10.rawValue, cornerArray: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
            return footer
        }else{
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = self.filterTblVw.dequeueReusableCell(withIdentifier: RoomsAndBedCell.className)as! RoomsAndBedCell
            return cell
        case 1:
            let cell = self.filterTblVw.dequeueReusableCell(withIdentifier: FilterCell.className)as! FilterCell
            return cell
        case 2:
            let cell = self.filterTblVw.dequeueReusableCell(withIdentifier: PriceRangeCell.className)as! PriceRangeCell
            return cell
        case 3:
            let cell = self.filterTblVw.dequeueReusableCell(withIdentifier: FilterCell.className)as! FilterCell
            return cell
        case 4:
            let cell = self.filterTblVw.dequeueReusableCell(withIdentifier: RatingCell.className)as! RatingCell
            GlobalMethods.shared.provideThreeCornerRadius(view: cell.ratingVw, cornerRadius: FontSize.size_10.rawValue, cornerArray: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
            return cell
        default:
            let cell = self.filterTblVw.dequeueReusableCell(withIdentifier: RoomsAndBedCell.className)as! RoomsAndBedCell
            return cell
        }
    }
}
