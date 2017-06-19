//
//  ViewController.swift
//  5000yen
//
//  Created by sadakoa on 2017/06/20.
//  Copyright © 2017年 sadakoa. All rights reserved.
//

import UIKit

// twitter連携に必要なもの
import Social

class ViewController: UIViewController {
    
    // MARK - 変数
    var myComposeView : SLComposeViewController!
    
    // MARK - イベント
    @IBAction func wantButton(_ sender: Any) {
        
        // Twitter Typeに設定
        myComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        // 投稿テキスト
        myComposeView.setInitialText("5000兆円欲しい！")
        
        // 投稿画像
        myComposeView.add(UIImage(named: "yen"))
        
        // モーダル起動
        self.present(myComposeView, animated: true, completion: nil)
        
        
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

