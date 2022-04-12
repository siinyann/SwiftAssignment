//
//  BookingsViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 8/4/22.
//

import UIKit

class BookingsViewController: UIViewController, UITableViewDataSource {
    
    var bookingList : [Booking] = []
    
    // All IB outlets for this view controller
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookingList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : BookingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BookingCell", for: indexPath) as! BookingTableViewCell
        let b = bookingList[indexPath.row]
        
        cell.nameLabel.text = b.name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let booking = bookingList[indexPath.row]
            DataManager.deleteBooking(id: booking.id)
            loadBookings()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add test data
        // DataManager.addTestData()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        loadBookings()
        
    }
    
    func loadBookings() {
        
        DataManager.loadBookings()
        {
            bookingListFromFirebase in
            
            self.bookingList = bookingListFromFirebase
            self.bookingList.sort{$0.name < $1.name}
            
            self.tableView.reloadData()
        }
        
    }
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Hide Tab Bar when push
        segue.destination.hidesBottomBarWhenPushed = true
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        if (segue.identifier == "ShowBookingDetails") {
            
            let detailsViewController = segue.destination as! BookingDetailsViewController
            
            if let path = tableView.indexPathForSelectedRow {
                let booking = bookingList[path.row]
                detailsViewController.booking = booking
            }
            
        }
        
        if(segue.identifier == "AddBooking") {
            
            let saveBookingViewController = segue.destination as! SaveBookingViewController
            let booking = Booking(id: "", name: "", email: "", result: "", date: "")
            saveBookingViewController.booking = booking
            
        }
    }
}
