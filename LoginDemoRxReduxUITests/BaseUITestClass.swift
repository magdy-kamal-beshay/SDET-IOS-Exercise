//
//  BaseUITestClass.swift
//  LoginDemoRxReduxUITests
//
//  Created by Magdy Kamal on 2/10/20.
//  Copyright © 2020 Mounir Dellagi. All rights reserved.
//

import XCTest
@testable import LoginDemoRxRedux

class BaseUITestClass: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        launchApp()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func launchApp() {
        app.launch()
    }
    
    func enterUsernameAndPassword(userName:String, password:String){
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText(userName)
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText(password)
        
    }
    
    func enterValidUserNameAndPassword() {
        enterUsernameAndPassword(userName: "TestUser", password: "TestPassword")
    }
    
    func enterInValidUserNameAndPassword() {
        enterUsernameAndPassword(userName: "FirstName", password: "FirstPassword")
    }
}
