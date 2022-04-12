//
//  BookingDetailsViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 8/4/22.
//

import UIKit

class BookingDetailsViewController: UIViewController {

    // All IB outlets for this view controller
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var booking: Booking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let b = booking {
            // Name, Email, Result and Date
            nameLabel.text = "Name: \(b.name)"
            emailLabel.text = "Email: \(b.email)"
            resultLabel.text = "Result: \(b.result)"
            dateLabel.text = "Date: \(b.date)"
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "EditBooking")
        {
            let saveBookingViewController = segue.destination as! SaveBookingViewController
            saveBookingViewController.booking = booking
        }
    }
}
