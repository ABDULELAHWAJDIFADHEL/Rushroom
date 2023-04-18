//
//  UIColor+Additions.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import UIKit

extension UIColor {
    
    class var appLightBluleColor: UIColor{
        return  UIColor(red: 106.0/255.0, green: 180.0/255.0, blue: 220.0/255.0, alpha: 1.0)
    }
    
    class var appTabBarTitleColor: UIColor {
        return  UIColor(red: 185.0/255.0, green: 190.0/255.0, blue: 204.0/255.0, alpha: 1.0)
    }
    
    @nonobjc class var lgButtonActiveColor: UIColor {
        return UIColor(red: 205/255.0, green: 144/255.0, blue: 66/255.0, alpha: 1)
    }
    
    @nonobjc class var lgButtonTitlColorColor: UIColor {
        return UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.4)
    }
    
    @nonobjc class var lgAccessoryBgColor: UIColor {
        return UIColor(red: 47/255.0, green: 52/255.0, blue: 59/255.0, alpha: 1)
    }
    
    @nonobjc class var lgNextButtonTitleColor: UIColor {
        return UIColor.lgWhiteColor(alpha: 0.4)
    }
    
    @nonobjc class func lgWhiteColor(alpha:Float) -> UIColor {
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.3)
    }
    
    static func by(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
        let d = CGFloat(255)
        return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    // MARK: UIColor additional properties
    class func colorWith(hexString: String)->UIColor {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.utf16.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func colorWith(hexString : ColorHexString) -> UIColor {
        
        let hexxString = hexString.rawValue
        var cString:String = hexxString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.utf16.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func colorWithAlpha(hexString: ColorHexString, alpha: Alpha) -> UIColor {
        
        let hexxString = hexString.rawValue
        var cString:String = hexxString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.utf16.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha.rawValue
        )
    }
    
    class func colorWithRGBA(redC: CGFloat, greenC: CGFloat, blueC: CGFloat, alfa: CGFloat) -> UIColor {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = alfa
        red   = CGFloat(redC/255.0)
        green = CGFloat(greenC/255.0)
        blue  = CGFloat(blueC/255.0)
        alpha  = CGFloat(alpha)
        let color: UIColor =  UIColor(red:CGFloat(red), green: CGFloat(green), blue:CGFloat(blue), alpha: alpha)
        return color
    }
}

extension UIColor {
    
    /// Converts this `UIColor` instance to a 1x1 `UIImage` instance and returns it.
    ///
    /// - Returns: `self` as a 1x1 `UIImage`.
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}


