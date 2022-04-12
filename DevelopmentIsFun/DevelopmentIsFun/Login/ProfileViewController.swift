//
//  ProfileViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 29/3/22.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    // All IB outlets for this view controller
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logoutButton_Tapped(_ sender: Any) {
        
        let auth = Firebase.Auth.auth()
        
        do {
          try auth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
        // Transition to the WelcomeViewController by pressing on the cancel button
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc,animated: true)
        
    }

}
