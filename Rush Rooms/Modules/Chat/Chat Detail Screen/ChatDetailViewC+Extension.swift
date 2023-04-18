//
//  ChatDetailViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 03/03/23.
//

import Foundation
import UIKit

extension ChatDetailViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ChatDetailViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftCell = self.chatTblVw.dequeueReusableCell(withIdentifier: ChatLeftCell.className)as! ChatLeftCell
        let rightCell = self.chatTblVw.dequeueReusableCell(withIdentifier: ChatRightCell.className)as! ChatRightCell
        if indexPath.row == 0 || indexPath.row == 3 {
            return leftCell
        }else{
            return rightCell
        }
    }
}
