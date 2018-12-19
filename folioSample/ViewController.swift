//
//  ViewController.swift
//  folioSample
//
//  Created by 水野祥子 on 2018/12/19.
//  Copyright © 2018年 sachiko. All rights reserved.
//

import UIKit
import FolioReaderKit
//https://www.buildinsider.net/hub/ebooksfree/2016
class ViewController: UIViewController {
    var mainpath:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let musicUrl = NSURL(string: "https://progit2.s3.amazonaws.com/ja/2016-02-11-8cb2f/progit-ja.1016.epub")
        if let url = musicUrl {
            let epubData = NSData(contentsOf: url as URL)
            
            let dataName = "progit-ja.1016.epub"
            
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            
            if let data = epubData {
                self.mainpath = "\(documentsPath)/\(dataName)"
                data.write(toFile: self.mainpath, atomically: true)
            }
        }
    }
    
    @IBAction func tap(_ sender: Any) {
        let config = FolioReaderConfig(withIdentifier: "")
        config.scrollDirection = .vertical
        config.shouldHideNavigationOnTap = false
//        let bookPath = Bundle.main.path(forResource: "FlowingExample3", ofType: "epub")
        let folioReader = FolioReader()
        folioReader.presentReader(parentViewController: self, withEpubPath: self.mainpath, andConfig: config)
    }
}

