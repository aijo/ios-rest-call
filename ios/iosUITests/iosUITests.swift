//
//  iosUITests.swift
//  iosUITests
//
//  Created by Chanintorn Asavavichairoj on 6/25/2559 BE.
//  Copyright © 2559 JO. All rights reserved.
//

import XCTest

class iosUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        let username = app.textFields["Username"]
        username.typeText("abc")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        let password = app.secureTextFields["Password"]
        password.typeText("abc")
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()
        app.alerts["Login"].collectionViews.buttons["OK"].tap()
        usernameTextField.tap()
        
        let alert = app.alerts["Login"]
        XCTAssertNotNil(alert)
    }
    
}
