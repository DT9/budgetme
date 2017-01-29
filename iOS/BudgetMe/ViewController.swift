//
//  ViewController.swift
//  BudgetMe
//
//  Created by Mohammad Al-Ahdal on 2017-01-28.
//  Copyright © 2017 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var customNavBar:CustomNavigationBar!
    var walkyTalky:JSONWalkyTalky!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(netHex: 0xF6F5AE)
        customNavBar = CustomNavigationBar(sender: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.walkyTalky = JSONWalkyTalky()
        walkyTalky.checkBankBalance()
        walkyTalky.checkTransactions()
        
        let delayInSeconds = 5.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            
            var totalSpent: Double = 0
            var totalMade: Double = 0
            
            for item in self.walkyTalky.transactions! {
                
                let currentActionItem = ((item.value as! NSDictionary).value(forKey: "amount")! as! Double)
                
                if currentActionItem >= 0{
                    totalMade += currentActionItem
                }else if currentActionItem < 0{
                    totalSpent -= currentActionItem
                }
                
            }
            
            var previousPercent:Double = 0.0
            
            for item in self.walkyTalky.transactions! {
                
                let currentActionItem = ((item.value as! NSDictionary).value(forKey: "amount")! as! Double)
                
                if currentActionItem >= 0 {
                    self.view.addSubview(CircleBar(startValue: previousPercent, percentageValue: (currentActionItem/(totalMade+totalSpent)) + previousPercent, barColor: UIColor(netHex:0x1C77C3), sender: self).circle)
                    previousPercent = (currentActionItem/(totalMade+totalSpent)) + previousPercent
                }else if currentActionItem < 0 {
                    self.view.addSubview(CircleBar(startValue: previousPercent, percentageValue: -(currentActionItem/(totalMade+totalSpent)) + previousPercent, barColor: UIColor(netHex:0xff8800), sender: self).circle)
                    previousPercent = -(currentActionItem/(totalMade+totalSpent)) + previousPercent
                }
                
            }
            
            
            let shitcircle:CircleStats = CircleStats(sender: self, color: UIColor(netHex:0x564138), title:"Balance", descriptor: "\(self.walkyTalky.currentBalance!)", textColor:UIColor(netHex: 0xF6F5AE))
            self.view.addSubview(shitcircle)
            
            
            
            
            self.view.addSubview(self.customNavBar)
        
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

