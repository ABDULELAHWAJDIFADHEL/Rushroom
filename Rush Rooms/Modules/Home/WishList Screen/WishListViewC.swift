//
//  WishListViewC.swift
//  Rush Rooms
//
//  Created by Kv on 24/02/23.
//

import UIKit

class WishListViewC: UIViewController {

    @IBOutlet weak var wishlistLbl: UILabel!
    @IBOutlet weak var wishListTblVw: UITableView!{
        didSet{
            self.wishListTblVw.delegate = self
            self.wishListTblVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
    }
    
    private func registerXIB(){
        self.wishListTblVw.register(nib: WishListCell.className)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
