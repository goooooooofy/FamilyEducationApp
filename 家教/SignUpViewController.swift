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
    
    var collectionView: UICollectionView!
    
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
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(DeviceData.width, DeviceData.height - CGRectGetMaxY(proViewLine.frame))
        layout.minimumLineSpacing = 0
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        collectionView = UICollectionView(frame: CGRectMake(0, CGRectGetMaxY(proViewLine.frame), DeviceData.width, DeviceData.height - CGRectGetMaxY(proViewLine.frame)), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "collection")
        self.collectionView?.pagingEnabled = true
        self.collectionView?.bounces = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(collectionView)
    }
    
    /**
    *  buttonAction  animation
    */
    func phoneSignAction(sender:UIButton) {
        sender.tintColor = UIColor.blueColor()
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.proViewLine.frame = CGRectMake(0, self.proViewLine.frame.origin.y, DeviceData.width/2, 5)
            }, completion: nil)
        
        self.collectionView.contentOffset.x += DeviceData.width
        
    }
    
    func emailSianAction(sender:UIButton) {
        sender.tintColor = UIColor.blueColor()
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.proViewLine.frame = CGRectMake(DeviceData.width/2, self.proViewLine.frame.origin.y, DeviceData.width/2, 5)
            }, completion: nil)
        self.collectionView.contentOffset.x -= DeviceData.width
         self.collectionView.reloadData()
    }
    
}

// MARK: - UICollectionView代理

extension SignUpViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCellWithReuseIdentifier("collection", forIndexPath: indexPath) 
        if indexPath.row == 0 {
            collection.backgroundColor = UIColor.redColor()
        } else {
            collection.backgroundColor = UIColor.greenColor()
        }
        return collection
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / DeviceData.width
        if page == 0 {
            UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.proViewLine.frame = CGRectMake(0, self.proViewLine.frame.origin.y, DeviceData.width/2, 5)
                }, completion: nil)
        } else {
            UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.proViewLine.frame = CGRectMake(DeviceData.width/2, self.proViewLine.frame.origin.y, DeviceData.width/2, 5)
                }, completion: nil)
        }
        }
    }
    
    
