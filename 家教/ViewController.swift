//
//  ViewController.swift
//  家教
//
//  Created by goofygao on 15/10/19.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController{
    
    @IBOutlet weak var searchStudent: UIButton!
    @IBOutlet weak var searchTeacher: UIButton!
    @IBOutlet weak var addButton: UIButton!
    var studentStatus:NSMutableArray?
    let requestExa = HttpRequest()
    let reuseIdentifier = "ContentCell"
   
    //测试数据
    let content = ["小学生辅导功课，帮助预习复习应试。初中生一样。高中帮忙灵活应付高考。带学生快乐开心地学习又有成果","英语水平在雅思七分以上或托福优秀，主要是口语和听力优秀，要最好最快的速度教会英语。","对小孩子有耐心，热爱教育行业，认真负责 。最好是擅长初中物理化学,检查学生的作业是否有批漏，订正，学生有不懂的题目帮学生解答。管好学生的纪律","1、有2年以上家教经验，有在培训机构从教经验者优先考虑\n2、熟悉初中或高中语文教学大纲、考试重难点 \n3、能够针对学生情况制定教学计划，独立编写教案 内容来自\n4、在授课期间适当组织测验活动，检验学生接受辅导的成效","辅导小学生作业，管理纪律，周一到五下午5：30~6：30有空的，喜欢和能与小朋友相处的。"]
    let yaoqiu = ["大一大二学生","找英语老师","擅长初中物理化学","有家教经验","辅导作业"]
    let place = ["五邑大学对面","丰乐小区","鹤翔小区","礼乐镇万福小区","卜蜂莲花对面"]
    //cell行高缓存
    var cellHeightCache = NSCache()
    //展示家教信息的TableView
    @IBOutlet weak var tableViewFraulein: UITableView!
    @IBOutlet var barButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
       self.initView()
        self.loadNewData()
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
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        //tableview 注册添加代理
        tableViewFraulein.delegate = self
        tableViewFraulein.dataSource = self
        let nib = UINib(nibName: "CustomFrauleinViewCell", bundle: nil)
        self.tableViewFraulein.registerNib(nib, forCellReuseIdentifier: reuseIdentifier)
        //  self.tableViewFraulein.sp=
        self.tableViewFraulein.backgroundColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        //tableView设置刷新
        //进入之后自动刷新
      // MJRefreshHeader
        let header = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: "headerRefreshGetNewInfo")
        var refreshImage = [UIImage]()
        for var i = 1; i <= 60; i++ {
            let string = NSString(format: "dropdown_anim__000%zd.png", i) as String
           
            refreshImage.append(UIImage(named: string)!)
        }
        header.setImages(refreshImage, forState: MJRefreshStateIdle)
        header.setImages(refreshImage, forState: MJRefreshStatePulling)
        header.setTitle("松开刷新", forState: MJRefreshStatePulling)
        header.setTitle("正在努力加载...", forState: MJRefreshStateRefreshing)
        header.stateLabel?.textColor = UIColor(white: 1, alpha: 0.9)
        header.lastUpdatedTimeLabel?.textColor = UIColor(white: 1, alpha: 0.9)
        
        self.tableViewFraulein.header = header
       // self.tableViewFraulein.header.beginRefreshing()
        self.initTabBar()
    }
    
    //初始化底部tabBar
    func initTabBar() {
        let tabBarView = UIView(frame: CGRectMake(0, DeviceData.height - 49, DeviceData.width, 49))
        tabBarView.backgroundColor = UIColor.redColor()
        self.view.addSubview(tabBarView)
        
        searchTeacher.setImage(UIImage(named: "16.png"), forState: UIControlState.Normal)
        searchTeacher.titleLabel?.textAlignment = NSTextAlignment.Center
        searchTeacher.setTitle("找老师", forState: UIControlState.Normal)
        searchTeacher.imageEdgeInsets = UIEdgeInsetsMake(10,40, 20,40)
        searchTeacher.titleLabel?.font = UIFont.systemFontOfSize(10)
        
        
        searchTeacher.titleLabel?.tintColor = UIColor.cyanColor()
        searchTeacher.titleEdgeInsets = UIEdgeInsetsMake(30, -50, 0, 10)
        searchTeacher.addTarget(self, action: "searchTeachAction", forControlEvents: UIControlEvents.TouchDown)
        
        searchStudent.setImage(UIImage(named: "18.png"), forState: UIControlState.Normal)
        searchStudent.titleLabel?.textAlignment = NSTextAlignment.Center
        searchStudent.setTitle("找学生", forState: UIControlState.Normal)
        searchStudent.imageEdgeInsets = UIEdgeInsetsMake(10,45, 20,45)
        searchStudent.titleLabel?.font = UIFont.systemFontOfSize(10)
        
        
        searchStudent.titleLabel?.tintColor = UIColor.cyanColor()
        searchStudent.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 10)
        searchStudent.addTarget(self, action: "searchStudentAction", forControlEvents: UIControlEvents.TouchDown)

    }
   
    

    func headerRefreshGetNewInfo() {
        self.tableViewFraulein.header.endRefreshing()
    }
    //MARK: - 用来加载找教师数据 - tabbar
    func searchTeachAction() {
        self.tableViewFraulein.header.beginRefreshing()
    }
    //MARK: - 用来加载找学生数据 - tabbar
    func searchStudentAction() {
        self.tableViewFraulein.header.beginRefreshing()
    }
    
    //网络请求数据
    
    func httpPostData() {
        Alamofire.request(.POST, "http://115.29.54.119:888/Post/requryInfo", parameters: ["num":"0"], encoding: ParameterEncoding.JSON, headers: nil).responseJSON { response -> Void in
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            if response.result.isSuccess {
                let jsonDic = response.result.value as! NSDictionary
                let dictArr:NSArray = jsonDic["stu"] as! NSArray
                let array = [Student]()
                self.studentStatus = NSMutableArray(array: array)
                for var dict in dictArr {
                    let studentBody = Student(dict: dict as! [NSObject : AnyObject])
                    self.studentStatus?.addObject(studentBody)
                }
                print(self.studentStatus?[1].created_at)
           
            }
        }
           print(self.studentStatus?[1].created_at)
        }
        

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
        return 3
    }
    
      func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomFrauleinViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.FrauleinDetailContent.text = self.studentStatus?[indexPath.row].stu_intro
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
        cell.StudentFrauleinTittle.text = self.studentStatus?[indexPath.row].stu_course
        cell.FrauleinPlace.text = self.studentStatus?[indexPath.row].stu_addr
        cell.FrauleinLevel.getLevelStar(Int(arc4random_uniform(6)))
        print(self.studentStatus?[1].created_at)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
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
   
    
    func loadNewData() {

        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer.acceptableContentTypes = NSSet(object: "text/html") as Set<NSObject>
        let params:NSDictionary = ["num":"0"]
        manager.POST("http://115.29.54.119:888/Post/requryInfo", parameters: params, success: { (operation, response) -> Void in
            let responseDic = response as? NSDictionary
            let dictArr:NSArray = (responseDic!["stu"] as? NSArray)!
            let array = [Student]()
            self.studentStatus = NSMutableArray(array: array)
            for var dict in dictArr {
                let studentBody = Student(dict: dict as! [NSObject : AnyObject])
                self.studentStatus?.addObject(studentBody)
                self.tableViewFraulein.reloadData()
            }
            print(self.studentStatus?.count)
            
            }) { (operation, error) -> Void in
                
        }
        
    }
    
}



