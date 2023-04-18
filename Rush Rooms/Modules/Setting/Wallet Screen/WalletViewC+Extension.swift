//
//  WalletViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import Foundation
import UIKit

extension WalletViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension WalletViewC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.walletTblVw.dequeueReusableCell(withIdentifier: WalletCell.className)as! WalletCell
        return cell
    }
}
