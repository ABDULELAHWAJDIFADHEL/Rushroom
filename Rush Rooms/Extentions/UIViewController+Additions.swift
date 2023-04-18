//
//  UIViewController+Additions.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func transparentNavigation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
     // MARK: - Create custom navigation bar with more than one button
    
    func createNavigationWithMoreButtons(leftBarButtonsType: [AssestsImageName], rightBarButtonsType: [AssestsImageName], title: String, bgColor: ColorHexString, titleColor: ColorHexString, fontName: String, fontSize: FontSize, fontWeight: FontWeight,imageTintColor:ColorHexString, isLineShow : Bool = false) {
        
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.barTintColor = UIColor.colorWith(hexString: bgColor)
        self.navigationController?.navigationBar.tintColor = UIColor.colorWith(hexString: imageTintColor)
        
        if title == APP_NAME {
            setImage()
        } else {
            self.navigationItem.title = title
        }
        
        var leftBarButtonItems = [UIBarButtonItem]()
        
        for leftButtonType in leftBarButtonsType {
            let image = UIImage(named: leftButtonType.rawValue)
            let leftBtn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(leftButtonTapped))
            leftBarButtonItems.append(leftBtn)
        }
        
        if leftBarButtonItems.count > 0 {
            self.navigationItem.leftBarButtonItems = leftBarButtonItems
        }
        
        var rightBarButtonItems = [UIBarButtonItem]()
        
        for rightButtonType in rightBarButtonsType {
            let image = UIImage(named: rightButtonType.rawValue)
            let rightBtn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(rightButtonTapped))
            rightBarButtonItems.append(rightBtn)
        }
        
        if rightBarButtonItems.count > 0 {
            self.navigationItem.rightBarButtonItems = rightBarButtonItems
        }
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.colorWith(hexString: titleColor),
             
             NSAttributedString.Key.font: UIFont.font(name: FontFamily.mulish, weight: fontWeight, size: fontSize)]
        
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.view.backgroundColor = UIColor.colorWith(hexString: bgColor)
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        
        if isLineShow {
            navigationController?.navigationBar.shadowImage = UIColor.colorWith(hexString: .APP_WHITE).as1ptImage()
        }
    }
    
    // MARK: - Create custom navigation bar
    
    func createNavgationBarWithImage(leftBtnImage: AssestsImageName?, rightBtnImage: AssestsImageName?, title: String, bgColor: ColorHexString, titleColor: ColorHexString, fontName: String, fontSize: FontSize, fontWeight: FontWeight, isLineShow : Bool = false) {
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.barTintColor = UIColor.colorWith(hexString: bgColor)
        
        if title == APP_NAME {
            setImage()
        } else {
            self.navigationItem.title = title
        }
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.colorWith(hexString: titleColor),
             
             NSAttributedString.Key.font: UIFont.font(name: FontFamily.mulish, weight: fontWeight, size: fontSize)]
        
        if let leftImage = leftBtnImage {
            let image = UIImage(named: leftImage.rawValue)
            let leftBtn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(leftButtonTapped))
            leftBtn.tintColor = UIColor.white
            self.navigationItem.leftBarButtonItem = leftBtn
        }
        
        if let rightImage = rightBtnImage {
            let image = UIImage(named: rightImage.rawValue)
            let rightBtn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(rightButtonTapped))
            rightBtn.tintColor = UIColor.white
            self.navigationItem.rightBarButtonItem = rightBtn
        }
        
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.view.backgroundColor = UIColor.colorWith(hexString: bgColor)
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        
        if isLineShow {
            navigationController?.navigationBar.shadowImage = UIColor.colorWith(hexString: .APP_WHITE).as1ptImage()
        }
    }
    
    // MARK: - Set Image on Navigation bar
    
    func setImage() {
        let image = UIImage(named: "catalyist")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        imageView.contentMode = .center
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    // MARK: - Left button tapped
    
    @objc func leftButtonTapped() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Right button tapped
    
    @objc func rightButtonTapped() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Set main view background color
    
    func setViewBackgroundColor(colorHexString : ColorHexString) {
        self.view.backgroundColor = UIColor.colorWith(hexString: colorHexString)
    }
    
}
