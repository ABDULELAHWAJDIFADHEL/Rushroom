//
//  UIView+Pinning.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import Foundation
import WebKit

extension UIView {
    public func attachSubviewUsingConstraints(subview: UIView) {
        assert(subview.superview == self, "superview of \(subview) has to be equal to \(self)")
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing,metrics: nil,views: ["view": subview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing,metrics: nil,views: ["view": subview]))
    }
    
    func hideD() -> Void {
        isHidden = true
    }
    
    func showD() -> Void {
        isHidden = false
    }
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    var placeHolderColor: UIColor? {
       get {
           return self.placeHolderColor
       }
       set {
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
       }
   }
    
}

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

extension UIViewController {
    var isDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }

}

extension Double {

    func getWholeNumber() -> Double {

        return modf(self).0

    }
    
    func getWholeNumberInt() -> Int {

        return Int(modf(self).0)

    }

    func getFractionNumber() -> Double {

        return modf(self).1

    }

}
