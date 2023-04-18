//
//  Indicator.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import Foundation
import UIKit
import Lottie

open class Indicator {
    let lottieviewForShow = AnimatableView()
    var animationView: AnimationView?

    var containerView = UIView()
    
    var progressView = UIView()
    
    var activityIndicator = UIActivityIndicatorView()
    
    var activityLabel = UILabel()
    
    open class var shared: Indicator {
        
        struct Static {
            
            static let instance: Indicator = Indicator()
            
        }
        
        return Static.instance
        
    }
        //Funny Lottie Loader
    open func showLottieAnimation(_ view : UIView){
        animationView = .init(name: "TPsP1NcPxe")
        lottieviewForShow.frame = view.frame
        lottieviewForShow.center = view.center
        lottieviewForShow.backgroundColor = UIColor(hex: 0x444444, alpha: 0.4)
        animationView?.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView?.center = view.center
        animationView?.backgroundColor = .clear
        animationView?.clipsToBounds = true
        animationView?.layer.cornerRadius = 10
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 1
        lottieviewForShow.addSubview(animationView ?? containerView)
        view.addSubview(lottieviewForShow)
        animationView?.play()
    }
    
    open func hideLottieAnimation(){
        animationView?.stop()
        lottieviewForShow.removeFromSuperview()
    }
    
    //Normal Loader
    open func showProgressView(_ view: UIView) {
        
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.3)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        progressView.center = view.center
        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
        //Normal Loading loader
    open func showProgressViewww(_ view: UIView) {
        
        let lodingLable = UILabel()
        lodingLable.textAlignment = .center
        lodingLable.textColor = .white
        lodingLable.text = "Loading..."
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.3)
        progressView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        progressView.center = view.center
        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: progressView.bounds.origin.x, y: progressView.bounds.origin.y, width: 40, height: 40)
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        lodingLable.frame = CGRect(x: progressView.bounds.origin.x, y: progressView.bounds.origin.y + 70, width: progressView.bounds.width, height: 20)
        activityIndicator.style = .whiteLarge
        progressView.addSubview(activityIndicator)
        progressView.addSubview(lodingLable)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        view.bringSubviewToFront(containerView)
        activityIndicator.startAnimating()
    }
    
    open func hideProgressView() {
        
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}

extension UIColor {
    
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
        
    }
}
