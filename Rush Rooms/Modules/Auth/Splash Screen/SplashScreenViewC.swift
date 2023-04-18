//
//  SplashScreenViewC.swift
//  Rush Rooms
//
//  Created by Kv on 16/02/23.
//

import UIKit
import DropDown

class SplashScreenViewC: UIViewController {

    @IBOutlet weak var languageVw, languageArabicVw: UIView!
    @IBOutlet weak var splashTitleLbl, splashSubTitleLbl, languageLbl: UILabel!
    @IBOutlet weak var splashSegmentOne, splashSegmentTwo, splashSegmentThree: UIImageView!
    @IBOutlet weak var splashCollectionVw: UICollectionView!{
        didSet{
            splashCollectionVw.delegate = self
            splashCollectionVw.dataSource = self
        }
    }
    
    let splashImageArr = [AssestsImageName.splashOne.rawValue, AssestsImageName.splashTwo.rawValue, AssestsImageName.splashThree.rawValue]
    let splashTitleArr = [KStrings.splashTitleOne.localizedString, KStrings.splashTitleTwo.localizedString, KStrings.splashTitleThree.localizedString]
    var dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Localize.currentLanguage())
        self.setUpViews()
        self.registerXIB()
        self.setUpLanguage()
    }
    
    @IBAction func skipBtn_Action(_ sender: Any) {
        let viewC = DIConfigurator.sharedInst().getWelcomeScreenViewC()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    private func registerXIB() -> Void {
        self.navigationController?.isNavigationBarHidden = true
        self.splashCollectionVw.registerNib(nib: SplashCell.className)
    }
    
    @IBAction func languageBtn_Action(_ sender: UIButton) {
        let arr = [CommonTexts.english.localizedString, CommonTexts.arabic.localizedString]
        if Localize.currentLanguage() == EN{
            self.dropDown.anchorView = languageVw
        }else{
            self.dropDown.anchorView = languageArabicVw
        }
        self.dropDown.backgroundColor = UIColor.white
        self.dropDown.dataSource = arr
        self.dropDown.show()
        self.dropDown.selectionAction = { (index: Int, item: String) in
            if item == CommonTexts.english.localizedString{
                self.languageLbl.text = EN
            }else{
                self.languageLbl.text = AR
            }
            self.languageBtnTap(index)
        }
    }
    
    func languageBtnTap(_ sender:Int){
       if sender == 0{
           Localize.setCurrentLanguage(language: EN)
           UIView.appearance().semanticContentAttribute = .forceLeftToRight
           UIButton.appearance().semanticContentAttribute = .forceLeftToRight
           UITextView.appearance().semanticContentAttribute = .forceLeftToRight
           UITextField.appearance().semanticContentAttribute = .forceLeftToRight
           UIScrollView.appearance().semanticContentAttribute = .forceLeftToRight
           UIImageView.appearance().semanticContentAttribute = .forceLeftToRight
           UILabel.appearance().semanticContentAttribute = .forceLeftToRight
       }else{
           Localize.setCurrentLanguage(language: AR)
           UIView.appearance().semanticContentAttribute = .forceRightToLeft
           UIButton.appearance().semanticContentAttribute = .forceRightToLeft
           UITextView.appearance().semanticContentAttribute = .forceRightToLeft
           UITextField.appearance().semanticContentAttribute = .forceRightToLeft
           UIScrollView.appearance().semanticContentAttribute = .forceRightToLeft
           UIImageView.appearance().semanticContentAttribute = .forceRightToLeft
           UILabel.appearance().semanticContentAttribute = .forceRightToLeft
       }
        Root.Splash()
   }
    
    private func setUpLanguage(){
        self.splashTitleLbl.text = KStrings.splashTitleOne.localizedString
        self.splashSubTitleLbl.text = KStrings.splashSubTitle.localizedString
        if Localize.currentLanguage() == EN{
            self.languageLbl.text = EN
            Localize.setCurrentLanguage(language: EN)
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
            UITextView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
            UIScrollView.appearance().semanticContentAttribute = .forceLeftToRight
            UIImageView.appearance().semanticContentAttribute = .forceLeftToRight
            UILabel.appearance().semanticContentAttribute = .forceLeftToRight
        }else{
            self.languageLbl.text = AR
            Localize.setCurrentLanguage(language: AR)
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
            UITextView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
            UIScrollView.appearance().semanticContentAttribute = .forceRightToLeft
            UIImageView.appearance().semanticContentAttribute = .forceRightToLeft
            UILabel.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
    
    private func setUpViews(){
        GlobalMethods.shared.provideCornerRadius(view: self.languageVw, cornerRadius: self.languageVw.bounds.height / TWO, borderColor: UIColor.colorWith(hexString: .BLACK_COLOR).cgColor, borderWidth: ONE)
    }
    
    func segmentImageSet(currentPage: Int){
        self.splashTitleLbl.text = splashTitleArr[currentPage]
        self.splashSubTitleLbl.text = KStrings.splashSubTitle.localizedString
        switch currentPage{
        case 0:
            self.setImage(rectange: self.splashSegmentOne, circle: [self.splashSegmentTwo, self.splashSegmentThree])
        case 1:
            self.setImage(rectange: self.splashSegmentTwo, circle: [self.splashSegmentOne, self.splashSegmentThree])
        default:
            self.setImage(rectange: self.splashSegmentThree, circle: [self.splashSegmentOne, self.splashSegmentTwo])
        }
    }
    
    private func setImage(rectange: UIImageView, circle: [UIImageView]){
        UIView.animate(withDuration: 1, delay: 0.5) {
            rectange.image = UIImage(named: AssestsImageName.rectangle.rawValue)
            for img in circle {
                img.image = UIImage(named: AssestsImageName.circle.rawValue)
            }
        }
    }
}
