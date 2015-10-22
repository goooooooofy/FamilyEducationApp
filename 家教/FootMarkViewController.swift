//
//  FreeTimeTableViewController.swift
//  家教
//
//  Created by goofygao on 15/10/21.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit

class FootMarkViewController: UIViewController {

    let label = UILabel(frame: CGRectMake(DeviceData.width/2, DeviceData.height/2, 100, 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randColor(1)
        label.text = "足迹"
        self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
