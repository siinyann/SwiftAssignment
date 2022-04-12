//
//  ArtFormViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 29/3/22.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase


class ArtFormViewController: UIViewController, UITextFieldDelegate {
    
//    let database = Firestore.firestore()
    

    // All IB outlets for this view controller
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var artLabel: UILabel!
    @IBOutlet weak var artField: UITextField!

    @IBOutlet weak var hrwLabel: UILabel!
    @IBOutlet weak var hrwField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the image of the UIimageView to logo image, to show the image of the company logo
        imageView.image = UIImage(named: "logo")
    }
    
    // Add ART Form data to the database
    @IBAction func nextButton_Tapped(_ sender: Any) {
        
        let db = Firestore.firestore()

        var ref: DocumentReference? = nil
        ref = db.collection("art").addDocument(data: [
            "name": nameField.text,
            "email": emailField.text,
            "art": artField.text,
            "hrw": hrwField.text
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
