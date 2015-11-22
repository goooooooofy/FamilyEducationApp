//
//  FreeTimeTableViewController.swift
//  家教
//
//  Created by goofygao on 15/10/21.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit

class RealNameViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "实名认证"
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
