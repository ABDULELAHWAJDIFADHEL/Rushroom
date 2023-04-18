//
//  CategorieCell+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import Foundation
import UIKit

extension CategorieViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension CategorieViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categorieTblVw.dequeueReusableCell(withIdentifier: CategorieCell.className)as! CategorieCell
        if indexPath.row == 2 || indexPath.row == 3{
            cell.checkBox.showD()
        }else{
            cell.checkBox.hideD()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("huihui")
    }
}
