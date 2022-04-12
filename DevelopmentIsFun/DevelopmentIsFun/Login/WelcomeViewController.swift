//
//  WelcomeViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 6/4/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    // All IB outlets for this view controller
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the image of the UIimageView to logo image, to show the image of the company logo
        imageView.image = UIImage(named: "logo")

    }
    
    @IBAction func loginButton_Tapped(_ sender: Any) {
        
        // Transition to the LoginViewController by pressing on the Login Button
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func signUpButton_Tapped(_ sender: Any) {
        
        // Transition to the SignUpViewController by pressing on the Sign Up Button
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc,animated: true)
    }
    
}
