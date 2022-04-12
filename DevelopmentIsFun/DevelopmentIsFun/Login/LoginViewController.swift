//
//  LoginViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 1/4/22.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    // All IB outlets for this view controller
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the image of the UIimageView to logo image, to show the image of the company logo
        imageView.image = UIImage(named: "logo")
        
        // Call the function to hide the error label
        setUpElements()

    }
    
    func setUpElements() {
        
        // Hide the error label in the LoginViewController
        errorLabel.alpha = 0
        
    }
 
    @IBAction func loginButton_Tapped(_ sender: Any) {
        
        // TODO: Validate Text Fields

        // Create cleaned versions of the text fields
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing In the user
        let auth = FirebaseAuth.Auth.auth()
        auth.signIn(withEmail: email, password: password) { (Authresult, error) in
            
            if error != nil {
                // Could't sign in
                // Show the error message whenever there is an error

                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
            }
            
            else {
                // Transition to the login screen
                self.transtionToHome()
            }
        }
    }
    
    func transtionToHome() {
        
        // Transition to the TabBarController on the home screen by pressing on the login button
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController)
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }

    @IBAction func cancelButton_Tapped(_ sender: Any) {
        
        // Transition to the WelcomeViewController by pressing on the cancel button
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc,animated: true)
        
    }
}
