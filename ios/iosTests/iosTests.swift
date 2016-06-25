//
//  iosTests.swift
//  iosTests
//
//  Created by Chanintorn Asavavichairoj on 6/25/2559 BE.
//  Copyright © 2559 JO. All rights reserved.
//

import XCTest
@testable import ios

class iosTests: XCTestCase {
    
    var vc: ViewController?
    
    override func setUp() {
        super.setUp()
        
        vc = ViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_should_show_data_correctly() {
        let result = vc!.caculateData()
        XCTAssertEqual(result, 2)
    }
    
}
