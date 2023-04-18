//
//  CommonStructFile.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import Foundation
import UIKit


struct imageSave {
    static var image = UIImageView()
    static var imageChange: String = "imageChange"
}

var APPLICATION_TYPE                     =           ApplicationTypeEnum.login.rawValue

let ZERO: CGFloat = 0
let INTZERO: Int = 0
let DOUBLEZERO: Double = 0.0
let EMPTY = ""
let EMPTY_ZERO = "0"
let EMPTY_SPACE = " "
let INTONE: Int = 1
let TWO: CGFloat = 2
let ONE = 1.0
let HALF = 0.5
let TEN = 10
let AND = "&"
let RS = "₹"
let NA = "N/A"
let COMMA = " , "
let NO_SPACE_COMMA = ", "
let DOSE = "Dose-"
let DASH  = " - "
let MULTIPLY = " * "
let PERCENTAGE = " %"

//ADDITION PROJECT USE FILES
import MaterialComponents.MaterialTextControls_OutlinedTextFields
struct MaterialComponents{
    static let shared = MaterialComponents()
    public func ProvideMaterialData(vw: [MDCOutlinedTextField]){
        for view in vw {
            view.font = UIFont.font(name: FontFamily.gilroy, weight: FontWeight.Regular, size: FontSize.size_16)
            view.setOutlineColor(UIColor.colorWith(hexString: .SHADOW_COLOR), for: .normal)
            view.setTextColor(UIColor.colorWith(hexString: .SHADOW_COLOR), for: .normal)
            view.containerRadius = FontSize.size_8.rawValue
            view.layer.cornerRadius = FontSize.size_8.rawValue
            if Localize.currentLanguage() == EN{
                view.textAlignment = .left
            }else{
                view.textAlignment = .right
            }
        }
    }
}

struct Root{
    
    static func Welcome(){
        DIConfigurator.sharedInst().getRootViewC(.Auth, identifer: WelcomeScreenViewC.className)
    }
    
    static func Login(){
        DIConfigurator.sharedInst().getRootViewC(.Auth, identifer: LoginEmailAndUserNameViewC.className)
    }
    
    static func Splash() {
        DIConfigurator.sharedInst().getRootViewC(.Auth, identifer: SplashScreenViewC.className)
    }
    
    static func SignUp(){
        DIConfigurator.sharedInst().getRootViewC(.Auth, identifer: SignUpViewC.className)
    }
    
    static func Home(){
        DIConfigurator.sharedInst().getRootViewC(.Map, identifer: MapViewC.className)
    }
}


struct UserDefault {
    static func Data(apiData: [String], ud: [String] ){
        for i in 0..<(apiData.count) {
            USER_DEFAULTS.set(apiData[i], forKey: ud[i])
        }
    }
}

struct dosageVaccineData{
    
    var id: String?
    var doseNumber: String?
    var timePeriod: String?
    
    init(id: String?, doseNumber: String?, timePeriod: String?) {
        self.id = id
        self.doseNumber = doseNumber
        self.timePeriod = timePeriod
    }
}


//struct Download{
//    var viewController = UIViewController()
//   static var shared = Download()
//    mutating func downloadPdf(_ viewController: UIViewController,_ url: String){
//        if let urlStr = NSURL(string: url) {
//            let objectsToShare = urlStr
//         UIApplication.shared.open(objectsToShare as URL)
//        }else{
//            self.viewController = viewController
//            self.viewController.showToast(message: AlertsMsgs.invalidURl.localizedString)
//        }
//    }
//}

import Lottie
struct AnimationStruct{
    static var shared = AnimationStruct()
    var animationView = LottieAnimationView()
    mutating func playAnimation(vw: AnimatableView, animationFile: String){
        animationView = .init(name: animationFile)
        animationView.frame = vw.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        vw.addSubview(animationView)
        animationView.play()
    }
}

//Strike Through C   (Cut string)
struct NsString{
    static let shared = NsString()
    func makeSlashText(_ text: String,value: Int) -> NSAttributedString {
     let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: value, range: NSMakeRange(0, attributeString.length))
    return attributeString
    }
}
