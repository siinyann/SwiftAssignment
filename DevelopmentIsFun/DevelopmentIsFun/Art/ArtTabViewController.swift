//
//  ArtTabViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 29/3/22.
//

import UIKit

class ArtTabViewController: UIViewController {

    // All IB outlets for this view controller
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the image of the UIimageView to logo image, to show the image of the company logo
        imageView.image = UIImage(named: "logo")
    }
}
