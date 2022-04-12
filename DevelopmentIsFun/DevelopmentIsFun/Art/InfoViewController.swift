//
//  InfoViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 25/3/22.
//

import UIKit
import WebKit

class InfoViewController: UIViewController {

    // All IB outlets for this view controller
    @IBOutlet weak var webView: WKWebView!
    
    // To display the covid.gov.sg website in the InfoViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.covid.gov.sg/")
        let urlRequest = URLRequest(url:url!)
        webView.load(urlRequest)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
