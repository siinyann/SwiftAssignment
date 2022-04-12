//
//  SaveBookingViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 8/4/22.
//

import UIKit

class SaveBookingViewController: UIViewController {
    
    var booking : Booking?
    
    // All IB outlets for this view controller
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var resultField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    
    @IBAction func saveButton_Tapped(_ sender: Any) {
        
        // Validate all fields
        if nameField.text == "" ||
            emailField.text == "" ||
            resultField.text == "" ||
            dateField.text == ""
        {
            // To display UIAlertController
            let alert = UIAlertController(
                title:"Please enter all fields",
                message: "",
                preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if let bookingItem = booking {
            
            let isNew = bookingItem.id == ""
            
            // Assign all data entered by user into the booking object
            bookingItem.name = nameField.text!
            bookingItem.email = emailField.text!
            bookingItem.result = resultField.text!
            bookingItem.date = dateField.text!
            
            // add or update bookings
            if (isNew) {
                DataManager.addBooking(booking: bookingItem)
            } else {
                DataManager.updateBooking(booking: bookingItem)
            }
            
            // Close this view controller to show all bookings
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let bookingItem = booking {
            
            let isNew = bookingItem.id == ""
            title = isNew ? "Add Booking" : "Edit Booking"

            nameField.text = bookingItem.name
            emailField.text = bookingItem.email
            resultField.text = bookingItem.result
            dateField.text = bookingItem.date
        }
    }
}
