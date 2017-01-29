//
//  CustomNavigationBar.swift
//  BudgetMe
//
//  Created by Mohammad Al-Ahdal on 2017-01-29.
//  Copyright © 2017 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit

class CustomNavigationBar: UIView {
    
    //let menuButton:UIButton = UIButton(frame: CGRect(x: 0, y: 10, width: 70, height: 70))
    
    init(sender: UIViewController) {
        let frame:CGRect = CGRect(x: 0, y: 0, width: sender.view.bounds.width, height: 70+20)
        super.init(frame: frame) //editthisbeforelaunch
        self.backgroundColor = UIColor(netHex: 0x564138)
        //menuButton.setImage(UIImage(named: "MenuButton"), for: .normal)
        //self.addSubview(menuButton)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            //print(touch.location(in: ))
            if !(touch.location(in: self).x >= 0 && touch.location(in: self).x <= 70){
                if !(touch.location(in: self).y >= 10 && touch.location(in: self).y <= 80){
                }
            }
        }
        
    }
    func printhello() {
        print("herllo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
