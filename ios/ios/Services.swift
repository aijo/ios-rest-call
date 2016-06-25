//
//  Services.swift
//  ios
//
//  Created by Chanintorn Asavavichairoj on 6/25/2559 BE.
//  Copyright © 2559 JO. All rights reserved.
//

import UIKit
import Alamofire

typealias Completion = (data: [String:AnyObject]?, error: NSError?) -> Void
typealias GetItemCompletion = (data: [Item]?, error: NSError?) -> Void

class Services {
    
    let host:String = "http://localhost:8080"
    
    class var sharedInstance: Services {
        struct Static {
            static let instance: Services = Services()
        }
        return Static.instance
    }
    
    func getToday(callback:Completion) {
        Alamofire.request(.GET, "\(host)/today", parameters:nil)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    print("[http.response]: \(response.result.value)")
                    if let data = response.result.value as? [String:AnyObject] {
                         callback(data: data, error: nil)
                    }
                case .Failure:
                    print("[http.response]: \(response.result.error)")
                    callback(data: nil, error: response.result.error)
                }
            }
        print("Calling webservice")
    }
    
    func login(username:String, password:String, callback:Completion) {
        let params = ["username": username, "password": password]
        
        Alamofire.request(.POST, "\(host)/login", parameters:params)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    print("[http.response]: \(response.result.value)")
                    if let data = response.result.value as? [String:AnyObject] {
                        callback(data: data, error: nil)
                    }
                case .Failure:
                    print("[http.response]: \(response.result.error)")
                    callback(data: nil, error: response.result.error)
                }
        }
    }
    
    func addItem(title:String, content:String, callback:Completion) {
        let params = ["title": title, "content": content]
        
        Alamofire.request(.POST, "\(host)/addItem", parameters:params)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    print("[http.response]: \(response.result.value)")
                    if let data = response.result.value as? [String:AnyObject] {
                        callback(data: data, error: nil)
                    }
                case .Failure:
                    print("[http.response]: \(response.result.error)")
                    callback(data: nil, error: response.result.error)
                }
        }
    }
    
    func getItems(callback:GetItemCompletion) {
        Alamofire.request(.GET, "\(host)/getItems", parameters:nil)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    print("[http.response]: \(response.result.value)")
                    if let data = response.result.value as? [[String:String]] {
                        var result = [Item]()
                        for item in data {
                            let i = Item(data: item)
                            result.append(i)
                        }
                        callback(data: result, error: nil)
                    }
                case .Failure:
                    print("[http.response]: \(response.result.error)")
                    callback(data: nil, error: response.result.error)
                }
        }
    }
    
    
    
}
