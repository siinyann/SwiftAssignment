//
//  Booking.swift
//  DevelopmentIsFun
//
//  Created by Swift on 8/4/22.
//

import UIKit

class Booking : NSObject {
    
    var id: String
    var name: String
    var email: String
    var result: String
    var date: String
    
    // To initialise the variables for the booking details
    init(id: String, name: String, email: String, result: String, date: String)
    {
        self.id = id
        self.name = name
        self.email = email
        self.result = result
        self.date = date
    }

}
