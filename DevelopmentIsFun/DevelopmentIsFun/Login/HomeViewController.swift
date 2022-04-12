//
//  HomeViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 6/4/22.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    // All IB outlets for this view controller
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the image of the UIimageView to logo image, to show the image of the company logo
        imageView.image = UIImage(named: "logo")

    }
}
