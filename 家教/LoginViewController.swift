//
//  LoginViewController.swift
//  家教
//
//  Created by goofygao on 15/11/14.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UINavigationControllerDelegate {

    let avaterImageView = UIImageView()
    
    let loginTextBG = UIImageView()
    
    let loginUserNameTextField = UITextField()
    
    let passwordTextField = UITextField()
    
    let loginButton = UIButton()
    
    var acitivityView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.toolbarHidden = true
        self.initView()
//        let time = NSTimer(timeInterval: 2, target: self, selector: "timerAction", userInfo: nil, repeats: true)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerAction", userInfo: nil, repeats: true)
    }
    
    
    //initView
    func initView() {
        
        avaterImageView.bounds.size = CGSizeMake(100, 100)
        avaterImageView.center = CGPointMake(DeviceData.width/2, 100)
        avaterImageView.image = UIImage(named: "touxiang.png")
        avaterImageView.layer.cornerRadius = 50
        avaterImageView.layer.masksToBounds = true
        avaterImageView.layer.borderWidth = 5
        avaterImageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.7).CGColor
        self.view.addSubview(avaterImageView)
        
        loginTextBG.bounds.size = CGSizeMake(DeviceData.width + 20, 100)
        loginTextBG.center = CGPointMake(DeviceData.width/2, 240)
        loginTextBG.alpha = 0.8
        loginTextBG.image = UIImage(named: "bg_login.png")
        self.view.addSubview(loginTextBG)
        
        loginUserNameTextField.frame = CGRectMake(40, 200, DeviceData.width - 80, 30)
        loginUserNameTextField.placeholder = "手机号/邮箱"
        loginUserNameTextField.borderStyle = UITextBorderStyle.None
        loginUserNameTextField.textAlignment = NSTextAlignment.Center
        loginUserNameTextField.keyboardType = UIKeyboardType.EmailAddress
        loginUserNameTextField.font = UIFont.systemFontOfSize(14)
        self.view.addSubview(loginUserNameTextField)
        
        passwordTextField.frame = CGRectMake(40, 250, DeviceData.width - 80, 30)
        passwordTextField.placeholder = "密码"
        passwordTextField.borderStyle = UITextBorderStyle.None
        passwordTextField.textAlignment = NSTextAlignment.Center
        passwordTextField.font = UIFont.systemFontOfSize(14)
        passwordTextField.keyboardType = UIKeyboardType.EmailAddress
        passwordTextField.secureTextEntry = true
        self.view.addSubview(passwordTextField)
        
        loginButton.frame = CGRectMake(20, 300, DeviceData.width - 40, 45)
        loginButton.setBackgroundImage(UIImage(named: "bt_login.png"), forState: UIControlState.Normal)
        loginButton.addTarget(self, action: "loginAction", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(loginButton)
        
        acitivityView.frame = CGRectMake(0, 0, 30, 30)
        acitivityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        acitivityView.center = CGPointMake(60, loginButton.center.y)
//        acitivityView.becomeFirstResponder()
        self.view.addSubview(acitivityView)
//        acitivityView.startAnimating()
    }
    
    func loginAction() {
        acitivityView.startAnimating()
        let queue:dispatch_queue_t?
//        dispatch_async(queue!) { () -> Void in
            let storyBoadrd = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let homePageNavigationController:UINavigationController = storyBoadrd.instantiateViewControllerWithIdentifier("homePage") as! UINavigationController
            self.presentViewController(homePageNavigationController, animated: true, completion: nil)

//        }
       //        sleep(3)
        
    }
    
    func timerAction() {
    
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
             self.avaterImageView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 1, 0)
            }) { (bool:Bool) -> Void in
                UIView.animateWithDuration(1) { () -> Void in
                    print("heh")
                    self.avaterImageView.layer.transform = CATransform3DMakeRotation(CGFloat(-M_PI_4), 0, 1, 0)
                }
        }
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if viewController == self {
            self.navigationController?.navigationBarHidden = true
        }
    }
}



