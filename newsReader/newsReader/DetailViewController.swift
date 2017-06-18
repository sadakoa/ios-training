//
//  DetailViewController.swift
//  newsReader
//
//  Created by sadakoa on 2017/06/18.
//  Copyright © 2017年 sadakoa. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var link:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: self.link) {
            let request = URLRequest(url: url)
            self.webView.loadRequest(request)
        }
    }
    
}
