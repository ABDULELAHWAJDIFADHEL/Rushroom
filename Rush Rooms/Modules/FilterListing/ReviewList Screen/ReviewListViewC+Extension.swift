//
//  ReviewListViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import Foundation
import UIKit

extension ReviewListViewC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ReviewListViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.reviewTblVw.dequeueReusableCell(withIdentifier: ReviewCell.className)as! ReviewCell
        return cell
    }
}
