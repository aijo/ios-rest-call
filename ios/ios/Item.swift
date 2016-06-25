//
//  Item.swift
//  ios
//
//  Created by Chanintorn Asavavichairoj on 6/25/2559 BE.
//  Copyright © 2559 JO. All rights reserved.
//

import Foundation

class Item {
    
    var title: String
    var content: String
    
    init(data:[String:String]) {
        title = data["title"] ?? ""
        content = data["content"] ?? ""
    }
    
}
