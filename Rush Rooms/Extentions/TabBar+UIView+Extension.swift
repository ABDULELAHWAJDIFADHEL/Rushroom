//
//  TabBar+UIView+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 21/02/23.
//

import Foundation
import UIKit

extension UIView{
   
    public func addShapeHome() {
        var shapeLayer1: CALayer?
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath1()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        shapeLayer.lineWidth = 0
        shapeLayer.shadowOffset = CGSize(width:0, height: -10)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.3

        if let oldShapeLayer = shapeLayer1 {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        shapeLayer1 = shapeLayer
    }
    
    func createPath1() -> CGPath {
        let path = UIBezierPath()
        let centerWidth = self.bounds.width / 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centerWidth / 2, y: 0))
        
        path.addCurve(to: CGPoint(x: centerWidth - 10, y: -35), controlPoint1: CGPoint(x: (centerWidth / 2) + 30, y: 0), controlPoint2: CGPoint(x: (centerWidth / 2) + 35, y: -30))
        
        path.addCurve(to: CGPoint(x: centerWidth + (centerWidth / 2), y: 0), controlPoint1: CGPoint(x: ((centerWidth * 2) - (centerWidth / 2) - 40), y: -32), controlPoint2: CGPoint(x: ((centerWidth * 2) - (centerWidth / 2) - 50), y: 5))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
    
    public func addShapeChat() {
        var shapeLayer1: CALayer?
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath2()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        shapeLayer.lineWidth = 0
        shapeLayer.shadowOffset = CGSize(width:0, height: -10)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.3

        if let oldShapeLayer = shapeLayer1 {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        shapeLayer1 = shapeLayer
    }
    
    func createPath2() -> CGPath {
        let path = UIBezierPath()
        let centerWidth = self.bounds.width / 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centerWidth - 10, y: 0))
        
        path.addCurve(to: CGPoint(x: centerWidth + (centerWidth / 4) + 20 , y: -35), controlPoint1: CGPoint(x: centerWidth + 10, y: 0), controlPoint2: CGPoint(x: centerWidth + 30, y: -30))
        
        path.addCurve(to: CGPoint(x: (centerWidth *  2) - (centerWidth / 4) + 20 , y: 0), controlPoint1: CGPoint(x: ((centerWidth * 2) - (centerWidth / 4) - 40), y: -33), controlPoint2: CGPoint(x: ((centerWidth * 2) - (centerWidth / 4)  - 30), y: 5))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
}
