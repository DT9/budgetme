//
//  CircleStats.swift
//  BudgetMe
//
//  Created by Mohammad Al-Ahdal on 2017-01-28.
//  Copyright © 2017 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit

class CircleStats:UIView {
    
    
    init(sender:UIViewController, color:UIColor, title:String, descriptor:String, textColor:UIColor) {
        super.init(frame: CGRect(x: 0, y: sender.view.bounds.height/4, width: sender.view.bounds.width/2, height: sender.view.bounds.height/2))
        
        var circle:CAShapeLayer!
        circle = CAShapeLayer()
        let centerPoint = CGPoint (x: sender.view.bounds.width / 2, y: sender.view.bounds.width / 2)
        let circleRadius : CGFloat = sender.view.bounds.width / 2 * 0.6
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI), clockwise:true)
        circle = CAShapeLayer ()
        circle.path = circlePath.cgPath
        circle.fillColor = color.cgColor
        
        
        let titleLabel:UILabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = textColor
        titleLabel.text = titleLabel.text!.uppercased()
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: self.bounds.width, y: self.bounds.height/2)
        
        
        let descriptorLabel: UILabel = UILabel()
        descriptorLabel.text = descriptor
        descriptorLabel.textColor = textColor
        descriptorLabel.text = descriptorLabel.text!.uppercased()
        descriptorLabel.sizeToFit()
        descriptorLabel.center = CGPoint(x: self.bounds.width, y: self.bounds.height/2 + 30)
        
        
        self.layer.addSublayer(circle)
        self.addSubview(descriptorLabel)
        self.addSubview(titleLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
