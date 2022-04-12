//
//  Utilities.swift
//  DevelopmentIsFun
//
//  Created by Swift on 6/4/22.
//

import Foundation
import UIKit

class Utilities {

    static func isPasswordValid(_ password : String) -> Bool{

        // Check the validation of the password using a regular expression
        // Password validation type contains these validations
        // Paasword length should be at least 8 characters long
        // Password should contained at least 1 alphabet
        // Password should contained at least 1 special character
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
