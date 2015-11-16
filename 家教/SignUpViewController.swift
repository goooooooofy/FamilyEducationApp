//
//  SignUpViewController.swift
//  家教
//
//  Created by goofygao on 15/11/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var phoneSignButton: UIButton!
    
    @IBOutlet weak var emailSignButton: UIButton!
    
    @IBOutlet weak var proViewLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        
        self.navigationController?.navigationBarHidden = false
        self.view.backgroundColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        phoneSignButton.addTarget(self, action: "phoneSignAction:", forControlEvents: UIControlEvents.TouchDown)
        emailSignButton.addTarget(self, action: "emailSianAction:", forControlEvents: UIControlEvents.TouchDown)
        
    }
    
    /**
    *  buttonAction  animation
    */
    func phoneSignAction(sender:UIButton) {
        sender.tintColor = UIColor.blueColor()
        UIView.animateWithDuration(0.7, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.proViewLine.frame = CGRectMake(0, self.proViewLine.frame.origin.y, DeviceData.width/2, 5)
            }, completion: nil)
    }
    
    func emailSianAction(sender:UIButton) {
        sender.tintColor = UIColor.blueColor()
        UIView.animateWithDuration(0.7, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.proViewLine.frame = CGRectMake(DeviceData.width/2, self.proViewLine.frame.origin.y, DeviceData.width/2, 5)
            }, completion: nil)
    }
}
