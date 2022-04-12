//
//  SignUpViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 1/4/22.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {
    
    // All IB outlets for this view controller
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the image of the UIimageView to logo image, to show the image of the company logo
        imageView.image = UIImage(named: "logo")
        
        // Call the function to hide the error label
        setUpElements()
        
    }
    
    func setUpElements() {
        
        // Hide the error label in the SignUpViewController
        errorLabel.alpha = 0
        
    }
    
    // Check the fields and validate that the data is correct.
    // If all data fields are correct, this function returns nil.
    // If  not, the function returns an error message
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fileds"
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password is not secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }

        return nil
        
    }
    
    @IBAction func signUpButton_Tapped(_ sender: Any) {
        
        // validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There was an error in the fields, show error message
            showError(error!)
            
        }
        
        else {
            
            // Create cleaned versions of the data
            let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            let auth = FirebaseAuth.Auth.auth()
            auth.createUser(withEmail: email, password: password) { (authResult, error) in
                
                // Check for errors
                if error != nil {
                    
                    //  There was an error creating the user
                    self.showError("Error creating user")
                    
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname": firstName, "lastname":lastName,"uid": authResult!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error in saving user data")
                        }
                        
                    }
                    
                    // Transition to the login screen
                    self.transtionToLogin()
        
                }
            }
        }
    }
        
    func showError(_ message: String) {
        
        // Show the error message whenever there is an error
        errorLabel.text = message
        errorLabel.alpha = 1
        
    }
    
    func transtionToLogin() {
        
        // Transition to the LoginViewController by pressing on the sign up button
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc,animated: true)
        
    }

    @IBAction func cancelButton_Tapped(_ sender: Any) {
        
        // Transition to the WelcomeViewController by pressing on the cancel button
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc,animated: true)
    }

}
