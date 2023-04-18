//
//  NotificationViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import Foundation
import UIKit

extension NotificationViewC: UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }else{
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

extension NotificationViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.notificationTblVw.dequeueReusableHeaderFooterView(withIdentifier: NotificationHeaderCell.className)as! NotificationHeaderCell
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.notificationTblVw.dequeueReusableCell(withIdentifier: NotificationCell.className)as! NotificationCell
        return cell
    }
}
