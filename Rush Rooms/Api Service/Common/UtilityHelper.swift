//
//  UtilityHelper.swift
//  Bayin
//
//  Created by Call Soft on 22/09/22.
//

import Foundation
import UIKit

class UtilityHelper {
    
    // MARK: - All Properties
    var container:UIView?
    var loadingView:UIView?
    var activityIndicator:UIActivityIndicatorView?
    var isVisible = false
    
    class var sharedInstance: UtilityHelper {
        struct Static {
            static let instance  = UtilityHelper()
        }
        return Static.instance
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            if !self.isVisible {
                self.isVisible = true
                
                if self.container == nil{
                    self.container = UIView()
                }
                
                if self.loadingView == nil{
                    self.loadingView = UIView()
                }
                
                if self.activityIndicator == nil{
                    self.activityIndicator = UIActivityIndicatorView()
                }
                
                guard let container = self.container, let loadingView = self.loadingView,let activityIndicator = self.activityIndicator else {
                    return
                }
                
                container.bounds = (KEY_WINDOW.first?.bounds)!
                container.center =  (KEY_WINDOW.first?.center)!
                container.backgroundColor = UIColor.clear
                loadingView.frame = CGRect(x:0, y:0, width: 75, height: 75)
                loadingView.center =  (KEY_WINDOW.first?.center)!
                loadingView.backgroundColor = UIColor.clear
                loadingView.clipsToBounds = true
                loadingView.layer.cornerRadius = 10
                activityIndicator.backgroundColor = .clear
                activityIndicator.frame = CGRect(x:0, y:0, width: 75, height: 75)
                if #available(iOS 13.0, *) {
                    activityIndicator.style = .large
                } else {
                    // Fallback on earlier versions
                }
                activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y:loadingView.frame.size.height / 2)
                loadingView.addSubview(activityIndicator)
                container.addSubview(loadingView)
                activityIndicator.color = UIColor(named: "Blue-Pacific") //UIColor.colorWith(hexString: .darkCyan)
                container.backgroundColor = .lightGray.withAlphaComponent(0.4)
                container.layer.zPosition = CGFloat(MAXFLOAT)
                let window  = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
                window?.addSubview(container)
                
                //KEY_WINDOW?.addSubview(container)
                activityIndicator.startAnimating()
            }
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.isVisible = false
            self.activityIndicator?.stopAnimating()
            self.container?.removeFromSuperview()
        }
    }
}
