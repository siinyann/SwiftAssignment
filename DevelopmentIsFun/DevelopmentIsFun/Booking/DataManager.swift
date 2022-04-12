//
//  DataManager.swift
//  DevelopmentIsFun
//
//  Created by Swift on 8/4/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class DataManager: NSObject {
    
    static var db = Firestore.firestore()
    
    // To add a booking
    static func addBooking(booking: Booking) {
        
        var ref: DocumentReference? = nil
        ref = db.collection("bookings").addDocument(data: [
            "name": booking.name,
            "email": booking.email,
            "result": booking.result,
            "date": booking.date
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    // To update a booking
    static func updateBooking(booking: Booking) {
        db.collection("bookings").document(booking.id).setData([
            "name": booking.name,
            "email": booking.email,
            "result": booking.result,
            "date": booking.date
        ]) { err in
            if let err = err {
                print("Error updating document \(booking.id): \(err)")
            } else {
                print("Document \(booking.id) successfullyn updated!")
            }
        }
    }
    
    // to delete a booking
    static func deleteBooking(id: String) {
        
        db.collection("bookings").document(id).delete() { err in
            if let err = err {
                print("Error removing document \(id): \(err)")
            } else {
                print("Document \(id) successfully removed!")
            }
        }
    }
    
    // To load bookings
    static func loadBookings(onComplete: @escaping (([Booking]) -> Void)) {
        db.collection("bookings").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                onComplete([])
            } else {
                var bookingList : [Booking] = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let booking = Booking(
                        id: document.documentID,
                        name: data["name"] as! String,
                        email: data["email"] as! String,
                        result: data["result"] as! String,
                        date: data["date"] as! String)
                    bookingList.append(booking)
                }
                onComplete(bookingList)
            }
        }
    }
    
    // To add test data to the database
    static func addTestData() {
        addBooking(booking: Booking(
            id: "0001",
            name: "Chong Sin Yan",
            email: "sinyanchong2@gmail.com",
            result: "Negative",
            date: "10/04/2022 0800"))
        
        addBooking(booking: Booking(
            id: "0002",
            name: "Chong Sin Yan",
            email: "sinyanchong2@gmail.com",
            result: "Negative",
            date: "12/04/2022 0900"))
        
        addBooking(booking: Booking(
            id: "0003",
            name: "Chong Sin Yan",
            email: "sinyanchong2@gmail.com",
            result: "Negative",
            date: "18/04/2022 1200"))
    }
}
