//
//  ChatDetailViewC.swift
//  Rush Rooms
//
//  Created by Kv on 03/03/23.
//

import UIKit

class ChatDetailViewC: UIViewController {

    @IBOutlet weak var hostNameLbl, locationLbl: UILabel!
    @IBOutlet weak var hostImage, onlineImage: UIImageView!
    @IBOutlet weak var msgBoxTxtVw: UITextView!
    @IBOutlet weak var chatTblVw: UITableView!{
        didSet{
            self.chatTblVw.delegate = self
            self.chatTblVw.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.chatTblVw.registerMultiple(nibs: [ChatRightCell.className, ChatLeftCell.className])
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func locationBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func callingBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func emojiBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func docBtn_Action(_ sender: Any) {
        
    }
    
    @IBAction func sendBtn_Action(_ sender: Any) {
        
    }
}
