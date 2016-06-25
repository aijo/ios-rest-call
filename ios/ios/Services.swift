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

class Services {
    
    let host:String = "http://10.10.83.131:8080"
    
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
    
    
    
    
    
    
    
    
    
}
