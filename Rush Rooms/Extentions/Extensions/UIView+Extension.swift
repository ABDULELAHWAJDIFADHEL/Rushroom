//
//  UIView+Extension.swift
//  Bayin
//
//  Created by Call Soft on 30/08/22.
//

import Foundation
import  UIKit

extension UIView{
    
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
        
    }
    
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: [0,0.5])
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
//    func addGradientSublayer(width:CGFloat, height:CGFloat) {
//        let gl = CAGradientLayer()
//        let color1 = UIColor.colorWith(hexString: .APP_WHITE)
//        let color2 = UIColor.colorWith(hexString: .APP_YELLOW)
//        gl.colors = [color1.cgColor, color2.cgColor] as [AnyObject]
//        gl.frame = CGRect(x: 0, y: 0, width: width, height: height)
//        self.layer.insertSublayer(gl, at: 0)
//    }
    
    func applyGradientVertical(colours: [UIColor]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func setGradientBackground() {
        let colorTop = UIColor.white.cgColor
        let colorBottom = UIColor.black.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func addShadow(_ shadowRadius: CGFloat = 4.0,_ shadowOpacity: Float = 0.5, color: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowColor = color.cgColor
    }
    
    func addShadowPath() {
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 1
    }
    
    func addShadowPath1() {
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: -10, height: 10)
        self.layer.shadowOpacity = 0.3
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func provideShadow1(view: UIView, shadowColor: CGColor, shadowOpacity: CGFloat, shadowOffset: CGSize, shadowRadius: CGFloat) {
        view.layer.shadowColor = shadowColor
        view.layer.shadowOpacity = Float(shadowOpacity)
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowRadius = shadowRadius
        view.layer.cornerRadius = shadowRadius
//        view.layer.cornerRadius = 10
    }
    
    func setBorder(width:CGFloat, borderColor:UIColor?) {
        layer.masksToBounds = true
        layer.borderWidth = width
        layer.borderColor = borderColor?.cgColor
    }
    
    func roundedAllCornerExceptTopRight(width: CGFloat, height: CGFloat) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomRight , .bottomLeft, .topLeft],
                                     cornerRadii: CGSize(width: width, height: height))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func roundedAllCornerExceptBottomLeft(width: CGFloat, height: CGFloat) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight , .topLeft, .bottomRight],
                                     cornerRadii: CGSize(width: width, height: height))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func roundedTopCorners(width: CGFloat, height: CGFloat) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight , .topLeft],
                                     cornerRadii: CGSize(width: width, height: height))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func roundedBottomCorners(width: CGFloat, height: CGFloat) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomRight , .bottomLeft],
                                     cornerRadii: CGSize(width: width, height: height))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
        
    enum UIViewFadeStyle {
        case bottom
        case top
        case left
        case right
        
        case vertical
        case horizontal
    }
    
    func fadeView(style: UIViewFadeStyle = .bottom, percentage: Double = 0.07) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.clear.cgColor]
        
        let startLocation = percentage
        let endLocation = 1 - percentage
        
        switch style {
        case .bottom:
            gradient.startPoint = CGPoint(x: 0.5, y: endLocation)
            gradient.endPoint = CGPoint(x: 0.5, y: 1)
        case .top:
            gradient.startPoint = CGPoint(x: 0.5, y: startLocation)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .vertical:
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
            gradient.locations = [0.0, startLocation, endLocation, 1.0] as [NSNumber]
            
        case .left:
            gradient.startPoint = CGPoint(x: startLocation, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .right:
            gradient.startPoint = CGPoint(x: endLocation, y: 0.5)
            gradient.endPoint = CGPoint(x: 1, y: 0.5)
        case .horizontal:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
            gradient.locations = [0.0, startLocation, endLocation, 1.0] as [NSNumber]
        }
        
        layer.mask = gradient
    }
}

internal extension UIView {
    struct Static {
        static var key = "key"
    }
    var viewIdentifier: String? {
        get {
            return objc_getAssociatedObject( self, &Static.key ) as? String
        }
        set {
            objc_setAssociatedObject(self, &Static.key, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}

extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
    
}

@IBDesignable
class GradientView: UIView {

    override class var layerClass: AnyClass { return CAGradientLayer.self }

    private var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }

    @IBInspectable var color1: UIColor = .white { didSet { updateColors() } }
    @IBInspectable var color2: UIColor = .blue  { didSet { updateColors() } }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureGradient()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGradient()
    }

    private func configureGradient() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        updateColors()
    }

    private func updateColors() {
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }

}

extension UISearchBar {
    func setPlaceholderTextColorTo(color: UIColor) {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = color
        let textFieldInsideSearchBarLabel = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
        textFieldInsideSearchBarLabel?.textColor = color
    }
}
