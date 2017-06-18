//
//  ViewController.swift
//  SNS
//
//  Created by sadakoa on 2017/06/17.
//  Copyright © 2017年 sadakoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func showActivityView(_ sender: UIBarButtonItem) {
        
        func showMesseage(){print("表示完了")}
        
        // imageView.imageは犬の画像
        let controller = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        //　クロージャ
        self.present(controller, animated: false, completion: showMesseage)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

