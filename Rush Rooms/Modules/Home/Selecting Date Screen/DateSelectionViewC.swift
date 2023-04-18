//
//  DateSelectionViewC.swift
//  Rush Rooms
//
//  Created by Kv on 27/02/23.
//

import UIKit
import FSCalendar

class DateSelectionViewC: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet weak var dateBottomVw: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var dateSelectionVw: FSCalendar!{
        didSet{
            self.dateSelectionVw.delegate = self
            self.dateSelectionVw.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
    }
    
    private func setUpViews(){
        GlobalMethods.shared.provideCornerRadius(view: self.dateSelectionVw, cornerRadius: FontSize.size_12.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.continueBtn, cornerRadius: self.continueBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.dateBottomVw, cornerRadius: FontSize.size_25.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    @IBAction func continueBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getAddGuestAndRoomViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        print(dateSelectionVw.minimumDate)
        print(dateSelectionVw.selectedDates)
        self.navigationController?.popViewController(animated: true)
    }
}
