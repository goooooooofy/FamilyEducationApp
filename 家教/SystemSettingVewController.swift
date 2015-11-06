//
//  SystemSettingVewController.swift
//  家教
//
//  Created by goofygao on 15/11/4.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit

class SystemSettingVewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.tableHeaderView = UIView(frame: CGRectMake(0,0,DeviceData.width,0))
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    
    
    
}

extension SystemSettingVewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let section = indexPath.section
        switch section {
            case 0:
                if indexPath.row == 0 {
                    cell?.textLabel?.text = "消息设置"
                } else if indexPath.row == 1 {
                    cell?.textLabel?.text = "账号设置"
                }else {
                    cell?.textLabel?.text = "隐私设置"
                }
                break
        default:
            if indexPath.row == 0 {
                cell?.textLabel?.text = "反馈问题"
            } else if indexPath.row == 1 {
                cell?.textLabel?.text = "版本更新"
            }else {
                cell?.textLabel?.text = "关于我们"
            }

            break
            
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return 3
        
    }
    

    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
}