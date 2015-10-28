//
//  ChatListTableViewCell.swift
//  家教
//
//  Created by goofygao on 15/10/22.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    //头像
    @IBOutlet weak var chatAvaterImage: UIImageView!
    //昵称
    @IBOutlet weak var chatNickName: UILabel!
    //最近的一次消息
    @IBOutlet weak var chatRecentMessage: UILabel!
    //最近一次消息的时间
    @IBOutlet weak var chatRecentTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //头像加蒙版
        chatAvaterImage.layer.cornerRadius = chatAvaterImage.frame.height/2
        chatAvaterImage.layer.masksToBounds = true
//        self.
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
