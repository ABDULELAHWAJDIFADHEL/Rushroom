//
//  CustomAlertViewC.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import UIKit
import Lottie

class CustomAlertViewC: BaseViewC {
    
    @IBOutlet weak var ok: UIButton!
    @IBOutlet weak var bottomVw: UIView!
    @IBOutlet weak var lottieVw: AnimatableView!
    @IBOutlet weak var subTitleText, titelText: UILabel!
    var animationView: LottieAnimationView?
    var animationString: String = ""
    var subTitleAlert: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.lottieFile()
    }
    
    //MARK: - All Additional Function
    private func setupView() -> Void {
        self.bottomVw.layer.cornerRadius = 40
        self.bottomVw.clipsToBounds = true
    }
    
    func lottieFile(){
        switch animationString{
        case AlertString.success:
            animationView = .init(name: AlertString.success)
            titelText.text = ErrorTexts.success.localizedString
            subTitleText.text = subTitleAlert
        case AlertString.error:
            animationView = .init(name: AlertString.error)
            titelText.text = ErrorTexts.error.localizedString
            subTitleText.text = subTitleAlert
        case AlertString.internetError :
            animationView = .init(name: AlertString.internetError)
            titelText.text = ErrorTexts.warning.localizedString
            subTitleText.text = ErrorTexts.errorMessage.localizedString
        case AlertString.alert:
            animationView = .init(name: AlertString.error)
            titelText.text = ErrorTexts.alert.localizedString
            subTitleText.text = subTitleAlert
        default:
            animationView = .init(name: AlertString.success)
            titelText.text = ErrorTexts.success.localizedString
            subTitleText.text = subTitleAlert
        }
        animationView?.frame = lottieVw.bounds
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 1
        lottieVw.addSubview(animationView!)
        animationView?.play()
    }
    @IBAction func okBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
