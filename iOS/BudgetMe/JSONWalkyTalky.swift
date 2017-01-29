//
//  JSONWalkyTalky.swift
//  BudgetMe
//
//  Created by Mohammad Al-Ahdal on 2017-01-29.
//  Copyright © 2017 Mohammad Al-Ahdal. All rights reserved.
//

import Foundation
import Firebase

class JSONWalkyTalky{
    
    var ref: FIRDatabaseReference!
    var generalRef: FIRDatabaseReference!
    var transactionRef: FIRDatabaseReference!
    var currentBalance: Double!
    var transactions: NSDictionary!
    
    init (){
        ref = FIRDatabase.database().reference()
        generalRef = ref.child("bank").child("generalInformation")
        transactionRef = ref.child("bank").child("transactions")
        
        
    }
    
    func getValue(name:String){
        
    }
    
    func checkTransactions() {
        transactionRef.observe(.value, with: {(snapshot) in
            let transactions = snapshot.value as! NSDictionary
            //print(snapshot.value)
            self.transactions = transactions.copy() as! NSDictionary
            //print(self.transactions)
            
        })
    }
    
    func checkBankBalance() {
        
        generalRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
            let currentBalance = snapshot.childSnapshot(forPath: "currentBalance").value as! Double
            self.currentBalance = currentBalance
            
        })
        
    }
    
}
