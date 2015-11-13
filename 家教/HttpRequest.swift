//
//  HttpRequest.swift
//  家教
//
//  Created by goofygao on 15/11/12.
//  Copyright © 2015年 goofyy. All rights reserved.
//

import Foundation
import Alamofire

enum HttpRequestMethod {
    case GET;
    case POST;
}

enum HttpForAnyBody {
    case Student;
    case Teacher;
}

class HttpRequest: NSObject {
    
    static let baseUrl = "http://115.29.54.119:888"
    
     static   var modelDataArr = [NSObject]()
      static  var modelDataArr2 = [NSObject]()
    /**
     POST请求
     单例模式 
     - parameter requestMethod: 请求的方式
     - parameter otherUrl:      请求的后缀地址
     - parameter parameters:    请求的参数
     - paramter  httpForAnyBody:请求的类型的类 Student OR Teacher
     */
    
      static  func httpPostData(requestMethod:HttpRequestMethod,otherUrl:String,parameters:NSDictionary,httpForAnyBody:HttpForAnyBody) -> [NSObject] {
        
        if requestMethod == .POST {
            /// 标识获取json规定字段
            let jsonGetDataFlag:String?
             if httpForAnyBody == .Student {
                modelDataArr = [Student]()
                jsonGetDataFlag = "stu"
                
             } else {
                self.modelDataArr = [Parents]()
                jsonGetDataFlag = "fam"
            }
            /**
            *  发送请求
            *
            *  @param .POST               请求的方式
            *  @param HttpRequest.baseUrl 请求的地址
            *
            *  @return 返回数据 数组
            */
            Alamofire.request(.POST, "\(HttpRequest.baseUrl)" + "\(otherUrl)", parameters: parameters as? [String : AnyObject], encoding: ParameterEncoding.JSON, headers: nil).responseJSON { response -> Void in
                if response.result.isSuccess {
                    let jsonDic = response.result.value as! NSDictionary
                    let dictArr:NSArray = jsonDic[jsonGetDataFlag!] as! NSArray
                    for var dict in dictArr {
                        
                        let dataBody = Student(dict: dict as! [NSObject : AnyObject])
                        self.modelDataArr.append(dataBody)
                        
                    }
                    
                }
                self.modelDataArr2 = self.modelDataArr
            }
           
        }
        return modelDataArr2
        
        
    }
    
}