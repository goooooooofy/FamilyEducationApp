//
//  CustomCollectionViewCell.swift
//  家教
//
//  Created by goofygao on 15/10/19.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit



class CustomFrauleinViewCell: UITableViewCell {
    //头像
    @IBOutlet weak var avaterImage: UIImageView!
    //家教标题
    @IBOutlet weak var StudentFrauleinTittle: UILabel!
    //家教星级
    @IBOutlet weak var FrauleinLevel: UIView!
    //最近家教次数
    @IBOutlet weak var recentFrauleinTime: UILabel!
    //家教地点
    @IBOutlet weak var FrauleinPlace: UILabel!
    //家教详细信息
    @IBOutlet weak var FrauleinDetailContent: UILabel!
    //家教期望资金
    @IBOutlet weak var FrauleinWantMoney: UILabel!
    //家教学生性别
    @IBOutlet weak var FrauleinStudentSex: UIImageView!
    //toolBar父视图
    @IBOutlet weak var barView: UIView!
    //收藏按钮
    @IBOutlet weak var collectButton: UIButton!
    //评论按钮
    @IBOutlet weak var commentButton: UIButton!
    //喜欢按钮
    @IBOutlet weak var likeButton: UIButton!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置cell层颜色
        self.backgroundColor = UIColor(white: 1, alpha: 0.9)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        avaterImage.layer.cornerRadius = avaterImage.bounds.height/2
        avaterImage.layer.masksToBounds = true
        let height = CGRectGetMaxY(barView.frame)
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    //获取高度
    func heightForCell(status:String)-> CGFloat{
        //设置数据
        self.FrauleinDetailContent.text = status
        //刷新布局
        self.layoutIfNeeded()
        //返回最最下方控件的最大Y值，就是高度啦
        return  CGRectGetMaxY(barView.frame)
    }
    
   
}
