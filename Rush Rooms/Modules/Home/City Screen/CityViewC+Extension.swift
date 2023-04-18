//
//  CityViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import Foundation
import UIKit

extension CityViewC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension CityViewC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.cityTblVw.dequeueReusableCell(withIdentifier: CityCell.className)as! CityCell
        return cell
    }
}
