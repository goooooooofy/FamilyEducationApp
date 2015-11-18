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
    
    var registerView: UIView = UIView()
    
    let phoneTextField = UITextField()
    
    let nickNameTextFied = UITextField()
    
    let passwordFirstText = UITextField()
    
    let passwordSecondText = UITextField()
    
    let verificationCodeText = UITextField()
    
    let getVerificationCodeButton = UIButton()
    
    let agreeProtocolButton = UIButton()
    
    let agreeTittleLabel = UILabel()
    
    let registerButton = UIButton()
    
    var timer = NSTimer?()
    
    var second = 60
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
    print(CGRectGetMaxY(proViewLine.bounds))
        registerView.frame = CGRectMake(0, CGRectGetMaxY(proViewLine.frame), DeviceData.width * 2 , DeviceData.height - CGRectGetMaxY(proViewLine.frame))
        registerView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(registerView)
        
        phoneTextField.frame = CGRectMake(40, 40, DeviceData.width - 80, 30)
        phoneTextField.placeholder = "输入你的手机号"
        phoneTextField.textColor = UIColor.blackColor()
        phoneTextField.borderStyle = UITextBorderStyle.RoundedRect
        phoneTextField.textAlignment = NSTextAlignment.Center
        phoneTextField.font = UIFont.systemFontOfSize(14)
        phoneTextField.keyboardType = UIKeyboardType.NumberPad
        phoneTextField.returnKeyType = UIReturnKeyType.Next
        self.registerView.addSubview(phoneTextField)
        
        nickNameTextFied.frame = CGRectMake(40, 80, DeviceData.width - 80, 30)
        nickNameTextFied.placeholder = "输入你的昵称"
        nickNameTextFied.textColor = UIColor.blackColor()
        nickNameTextFied.borderStyle = UITextBorderStyle.RoundedRect
        nickNameTextFied.textAlignment = NSTextAlignment.Center
        nickNameTextFied.font = UIFont.systemFontOfSize(14)
        nickNameTextFied.keyboardType = UIKeyboardType.EmailAddress
        nickNameTextFied.returnKeyType = UIReturnKeyType.Next
        self.registerView.addSubview(nickNameTextFied)
        
        passwordFirstText.frame = CGRectMake(40, 120, DeviceData.width - 80, 30)
        passwordFirstText.placeholder = "密码(不少于6位)"
        passwordFirstText.textColor = UIColor.blackColor()
        passwordFirstText.borderStyle = UITextBorderStyle.RoundedRect
        passwordFirstText.textAlignment = NSTextAlignment.Center
        passwordFirstText.font = UIFont.systemFontOfSize(14)
        passwordFirstText.keyboardType = UIKeyboardType.EmailAddress
        passwordFirstText.returnKeyType = UIReturnKeyType.Next
        self.registerView.addSubview(passwordFirstText)
        
        passwordSecondText.frame = CGRectMake(40, 160, DeviceData.width - 80, 30)
        passwordSecondText.placeholder = "重复密码"
        passwordSecondText.textColor = UIColor.blackColor()
        passwordSecondText.borderStyle = UITextBorderStyle.RoundedRect
        passwordSecondText.textAlignment = NSTextAlignment.Center
        passwordSecondText.font = UIFont.systemFontOfSize(14)
        passwordSecondText.keyboardType = UIKeyboardType.EmailAddress
        passwordSecondText.returnKeyType = UIReturnKeyType.Next
        self.registerView.addSubview(passwordSecondText)

        verificationCodeText.frame = CGRectMake(40, 200, DeviceData.width - 140, 30)
        verificationCodeText.placeholder = "输入验证码"
        verificationCodeText.textColor = UIColor.blackColor()
        verificationCodeText.borderStyle = UITextBorderStyle.RoundedRect
        verificationCodeText.textAlignment = NSTextAlignment.Center
        verificationCodeText.font = UIFont.systemFontOfSize(14)
        verificationCodeText.keyboardType = UIKeyboardType.EmailAddress
        verificationCodeText.returnKeyType = UIReturnKeyType.Next
        self.registerView.addSubview(verificationCodeText)
        
        getVerificationCodeButton.frame = CGRectMake(CGRectGetMaxX(verificationCodeText.frame) + 10, CGRectGetMinY(verificationCodeText.frame), 80, 30)
        getVerificationCodeButton.backgroundColor = UIColor.blueColor()
        getVerificationCodeButton.setTitle("获取验证码", forState: UIControlState.Normal)
        getVerificationCodeButton.titleLabel?.font = UIFont.systemFontOfSize(13)
        getVerificationCodeButton.titleLabel?.text = "获取验证码"
        getVerificationCodeButton.addTarget(self, action: "getVerificationCodeAction:", forControlEvents: UIControlEvents.TouchDown)
        self.registerView.addSubview(getVerificationCodeButton)

        agreeProtocolButton.frame = CGRectMake(40, 240, 20, 20)
        agreeProtocolButton.setImage(UIImage(named: "new_feature_share_false"), forState: UIControlState.Normal)
        agreeProtocolButton.setImage(UIImage(named: "new_feature_share_true"), forState: UIControlState.Highlighted)
        self.registerView.addSubview(agreeProtocolButton)
        
        agreeTittleLabel.frame = CGRectMake(65, 240, 100, 21)
        agreeTittleLabel.text = "同意协议 "
        self.registerView.addSubview(agreeTittleLabel)
    }
    
    /**
    *  buttonAction  animation
    */
    func phoneSignAction(sender:UIButton) {
        sender.tintColor = UIColor.blueColor()
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.proViewLine.frame = CGRectMake(0, self.proViewLine.frame.origin.y, DeviceData.width/2, 5)
            }, completion: nil)
        self.registerView.bounds.origin.x -= DeviceData.width
        
    }
    
    func emailSianAction(sender:UIButton) {
        sender.tintColor = UIColor.blueColor()
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.proViewLine.frame = CGRectMake(DeviceData.width/2, self.proViewLine.frame.origin.y, DeviceData.width/2, 5)
            }, completion: nil)
        self.registerView.bounds.origin.x += DeviceData.width
//         self.collectionView.reloadData()
    }
    
    func getVerificationCodeAction(sender:UIButton) {
        sender.enabled = false
       timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerAction", userInfo: nil, repeats: true)
        }
    
    func timerAction() {
        if second == 1 {
            timer = nil
            getVerificationCodeButton.enabled = true
            getVerificationCodeButton.backgroundColor = UIColor.blueColor()
        } else {
            second--
            getVerificationCodeButton.backgroundColor = UIColor(hue: 1, saturation: 0.23, brightness: 0.54, alpha: 0.8)
            getVerificationCodeButton.setTitle("\(second)" + "秒后重发", forState: UIControlState.Normal)
        }
        
        
        
    }
}


    
