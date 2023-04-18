//
//  ReviewListViewC.swift
//  Rush Rooms
//
//  Created by Kv on 28/02/23.
//

import UIKit

class ReviewListViewC: UIViewController {

    @IBOutlet weak var reviewBtn: UIButton!
    @IBOutlet weak var reviewTitleLbl: UILabel!
    @IBOutlet weak var reviewLbl: UILabel!
    @IBOutlet weak var reviewTblVw: UITableView!
    {
        didSet{
            self.reviewTblVw.delegate = self
            self.reviewTblVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
        self.setUpView()
    }
    
    private func setUpView(){
        GlobalMethods.shared.provideCornerRadius(view: self.reviewBtn, cornerRadius: self.reviewBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
    }
    
    private func registerXIB(){
        self.reviewTblVw.register(nib: ReviewCell.className)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func writeReviewBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getReviewViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
