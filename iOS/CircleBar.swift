//
//  CircleBar.swift
//  BudgetMe
//
//  Created by Mohammad Al-Ahdal on 2017-01-28.
//  Copyright © 2017 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit

class CircleBar {

    var circle:UIView
    var color:UIColor
    var endValue:Double
    var startValue:Double
    
    init(startValue:Double, percentageValue:Double, barColor:UIColor, sender:ViewController) {
        self.circle = UIView(frame: CGRect(x: 0, y: sender.view.bounds.height/4, width: 100, height: 100))
        self.endValue = 1.0;
        //self.circle.backgroundColor = UIColor(white: 0, alpha: 0)
        
        //if previousNode != nil {
            self.endValue = percentageValue + startValue
            self.startValue = startValue
        //}else{
            self.endValue = percentageValue
            self.startValue = 0
        //}
        
        self.circle.layoutIfNeeded()
        var progressCircle = CAShapeLayer()
        
        let centerPoint = CGPoint (x: sender.view.bounds.width / 2, y: sender.view.bounds.width / 2)
        let circleRadius : CGFloat = sender.view.bounds.width / 2 * 0.70
        
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI), clockwise:true)
        
        progressCircle = CAShapeLayer ()
        progressCircle.path = circlePath.cgPath
        color = barColor
        progressCircle.strokeColor = color.cgColor
        progressCircle.fillColor = UIColor.clear.cgColor
        progressCircle.lineWidth = 20
        progressCircle.strokeStart = CGFloat.init(startValue)
        progressCircle.strokeEnd = CGFloat.init(endValue)
        circle.layer.addSublayer(progressCircle)
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.fromValue = self.startValue
        animation.toValue = self.endValue
        animation.duration = 1
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        progressCircle.add(animation, forKey: "ani")
        
    }
    
    
}
