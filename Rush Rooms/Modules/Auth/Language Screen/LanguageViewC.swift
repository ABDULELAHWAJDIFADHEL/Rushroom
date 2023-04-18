//
//  LanguageViewC.swift
//  Rush Rooms
//
//  Created by Kv on 21/02/23.
//

import UIKit

class LanguageViewC: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var englishLbl, arabicLbl, languageSubTitleLbl: UILabel!
    @IBOutlet weak var englishVw, arabicVw, bottomConfirmVw: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.setUpLanguage()
    }
    
    private func setUpViews(){
        GlobalMethods.shared.provideCornerRadius(view: self.confirmBtn, cornerRadius: self.confirmBtn.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideCornerRadius(view: self.englishVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
        GlobalMethods.shared.provideCornerRadius(view: self.arabicVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
        GlobalMethods.shared.provideThreeCornerRadius(view: self.bottomConfirmVw, cornerRadius: FontSize.size_30.rawValue, cornerArray: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    private func setUpLanguage(){
        self.languageSubTitleLbl.text = KStrings.languageSubTitle.localizedString
        self.confirmBtn.setTitle(KStrings.confirm.localizedString, for: .normal)
        if Localize.currentLanguage() == EN{
            GlobalMethods.shared.provideCornerRadius(view: self.englishVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
            GlobalMethods.shared.provideCornerRadius(view: self.arabicVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
            self.englishLbl.textColor = UIColor.black
            self.arabicLbl.textColor = UIColor.lightGray
        }else{
            GlobalMethods.shared.provideCornerRadius(view: self.englishVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .CLEAR).cgColor, borderWidth: ZERO)
            GlobalMethods.shared.provideCornerRadius(view: self.arabicVw, cornerRadius: FontSize.size_20.rawValue, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
            self.englishLbl.textColor = UIColor.lightGray
            self.arabicLbl.textColor = UIColor.black
        }
       
    }
    
    @IBAction func arabicBtn_Action(_ sender: Any) {
        Localize.setCurrentLanguage(language: AR)
        self.setUpLanguage()
    }
    
    @IBAction func englishBtn_Action(_ sender: Any) {
        Localize.setCurrentLanguage(language: EN)
        self.setUpLanguage()
    }
    @IBAction func confitmBtn_Action(_ sender: Any) {
        Root.Splash()
    }
}
