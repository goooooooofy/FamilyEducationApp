//
//  FamilyInfoViewController.swift
//  家教
//
//  Created by goofygao on 15/11/18.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit

class FamilyInfoViewController: UIViewController {

    let defaultValue = NSUserDefaults.standardUserDefaults()
    let personalInfoLabelUserName = UILabel()
    let personalInfoLabelStuID = UILabel()
    var avaterImageView = UIImageView()
//    let personalInfoLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let familyEducationData = defaultValue.valueForKey("stu_age")
        initView()
        
        
    }
    
    /**
     初始化界面
     
     - returns: 无返回值
     */
    func initView() {
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "详细信息"
        avaterImageView = UIImageView(frame: CGRectMake(DeviceData.width * 1/7, 30, 60, 60))
        avaterImageView.layer.cornerRadius = avaterImageView.bounds.width/2
        avaterImageView.layer.masksToBounds = true
        avaterImageView.image = UIImage(named: "touxiang.png")
        self.view.addSubview(avaterImageView)
        
        personalInfoLabelUserName.frame = CGRectMake(DeviceData.width * 1/7 + 80, 40, DeviceData.width * 4/7, 21)
//        personalInfoLabel.tintColor = UIColor.whiteColor()
        personalInfoLabelUserName.text = "用户名: " + "\(defaultValue.valueForKey("username")!)"
        personalInfoLabelUserName.textColor = UIColor.whiteColor()
        personalInfoLabelUserName.font = UIFont.systemFontOfSize(15)
        self.view.addSubview(personalInfoLabelUserName)
        
        personalInfoLabelStuID.frame = CGRectMake(DeviceData.width * 1/7 + 80, 68, DeviceData.width * 4/7, 21)
        personalInfoLabelStuID.text = "用户ID: " + "\(defaultValue.valueForKey("stu_id")!)"
        personalInfoLabelStuID.textColor = UIColor.whiteColor()
        personalInfoLabelStuID.font = UIFont.systemFontOfSize(15)
        self.view.addSubview(personalInfoLabelStuID)
    }
    
    
    
    
}
