//
//  ChatViewC+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 22/02/23.
//

import Foundation
import UIKit

extension ChatViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ChatViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chatTblVw.dequeueReusableCell(withIdentifier: ChatCell.className) as! ChatCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewC = DIConfigurator.sharedInst().getChatDetailViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
