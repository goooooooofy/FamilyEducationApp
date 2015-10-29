//
//  ViewController.swift
//  家教
//
//  Created by goofygao on 15/10/19.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var addButton: UIButton!
    let reuseIdentifier = "ContentCell"
    let content = ["示区域默认是填充整个button，首先利用contentEdgeInsets属性，将内容上下左右压缩","卡农并非特指一首曲子，其原意为“规则”，“同一旋律以同度或五度等不同的高度在各声部先后出现，造成此起彼落连续不断的模仿；一个声部的曲调","人永远是把生活细节经过艺术加工和拔高之后展示于人前的","人越是明白，越是有追求，就越孤独。《心是孤独的猎手》","卡农并非特指一首曲子，其原意为“规则”，“同一旋律以同度或五度等不同的高度在各声部先后出现，造成此起彼落连续不断的模仿；一个声部的曲调自始至终追逐着另一声部,直到最后,它们会融合在一起，永不分离”，一如人世间至死不渝的爱情，相爱的两人生死相随，缠绵至极","人永远是把生活细节经过艺术加工和拔高之后展示于人前的"]
    //cell行高缓存
    var cellHeightCache = NSCache()
    //展示家教信息的TableView
    @IBOutlet weak var tableViewFraulein: UITableView!
    @IBOutlet var barButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.initView()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Your Menu View Controller vew must know the following data for the proper animatio
        let destinationVC = segue.destinationViewController as? GuillotineMenuViewController
        destinationVC?.hostNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
        destinationVC?.hostTitleText = self.navigationItem.title
        destinationVC?.view.backgroundColor = self.navigationController!.navigationBar.barTintColor
        destinationVC?.setMenuButtonWithImage(barButton.imageView!.image!)
        
    }
    
    
    //MARK: - 初始化视图控制器
    
    func initView() {
        //navigation设置
        let navBar = self.navigationController!.navigationBar
        navBar.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //tableview 注册添加代理
        tableViewFraulein.delegate = self
        tableViewFraulein.dataSource = self
        let nib = UINib(nibName: "CustomFrauleinViewCell", bundle: nil)
        self.tableViewFraulein.registerNib(nib, forCellReuseIdentifier: reuseIdentifier)
        //  self.tableViewFraulein.sp
        self.tableViewFraulein.backgroundColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        //tableView设置刷新
        //进入之后自动刷新
      // MJRefreshHeader
        let header = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: "headerRefreshGetNewInfo")
        var refreshImage = [UIImage]()
        for var i = 1; i <= 60; i++ {
            let string = NSString(format: "dropdown_anim__000%zd.png", i) as String
            print(string)
            refreshImage.append(UIImage(named: string)!)
        }
        header.setImages(refreshImage, forState: MJRefreshStateIdle)
        header.setImages(refreshImage, forState: MJRefreshStatePulling)
        header.setTitle("松开刷新", forState: MJRefreshStatePulling)
        header.setTitle("正在努力加载...", forState: MJRefreshStateRefreshing)
        header.stateLabel?.textColor = UIColor(white: 1, alpha: 0.9)
        header.lastUpdatedTimeLabel?.textColor = UIColor(white: 1, alpha: 0.9)
        self.tableViewFraulein.header = header
        self.initTabBar()
    }
    
    //初始化底部tabBar
    func initTabBar() {
        let tabBarView = UIView(frame: CGRectMake(0, DeviceData.height - 49, DeviceData.width, 49))
        tabBarView.backgroundColor = UIColor.redColor()
        self.view.addSubview(tabBarView)
    }
    func getCellHeight(cellHeight: CGFloat) {
        print("hello")
    }

    func headerRefreshGetNewInfo() {
        self.tableViewFraulein.header.endRefreshing()
    }
    
    
}



//MARK: - tableview添加代理方法

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
      func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
      func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomFrauleinViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.FrauleinDetailContent.text = content[indexPath.row]
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
        cell.FrauleinLevel.getLevelStar(3)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let rowHeight = cellHeightCache.objectForKey(indexPath.row) as? CGFloat {
            return rowHeight
        }
        let cell = tableViewFraulein.dequeueReusableCellWithIdentifier(reuseIdentifier) as! CustomFrauleinViewCell
        let rowHeight = cell.heightForCell(content[indexPath.row]) + 2
        //把行高放进缓存
        cellHeightCache.setObject(cell.heightForCell(content[indexPath.row]) + 2, forKey: indexPath.row)
        return rowHeight
    }
    
    //MARK: -button action
    
    @IBAction func rightNavigationItemAction(sender: UIButton) {
        self.presentViewController(ChatListViewController(), animated: true, completion: nil)
        
    }
   

    
}



