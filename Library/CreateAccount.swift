//
//  CreateAccount.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-02-16.
//  Copyright © 2018 FBApps. All rights reserved.
//

import Foundation



func isValidPassword(testStr:String?) -> Bool {
    guard testStr != nil else { return false }
    
    // at least one uppercase,
    // at least one digit
    // at least one lowercase
    // 8 characters total
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
    return passwordTest.evaluate(with: testStr)
}

func isValidEmail(email:String?) -> Bool {
    
    guard email != nil else { return false }
    
    let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
    return pred.evaluate(with: email)
}
