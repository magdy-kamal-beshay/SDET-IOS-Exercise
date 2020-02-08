//
//  LoginViewUITests.swift
//  LoginViewUITests
//
//  Created by Magdy Kamal on 2/8/20.
//  Copyright © 2020 Mounir Dellagi. All rights reserved.
//

import XCTest
@testable import LoginDemoRxRedux

class LoginViewUITests: XCTestCase {

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
   
    func testCheckIfTitleLableExists() {
        let travelAppLabel = app.staticTexts["travelapp"]
        XCTAssert(travelAppLabel.exists)
    }

    func testCheckIfBackgroundImageExists() {
        let backgroundImage = app.images["mountain"]
        XCTAssert(backgroundImage.exists)
    }
    
    func testCheckIfUserNameExists() {
        let userName = app.textFields["Username"]
        XCTAssert(userName.exists)
    }
    
    func testCheckIfPasswordExists() {
        let password = app.secureTextFields["Password"]
        XCTAssert(password.exists)
    }
    
    func testCheckIfLoginButtonExists() {
        let loginBtn = app.buttons["Login"]
        XCTAssert(loginBtn.exists)
    }
    
    func testCheckIfRegisterButtonExists() {
        let registerBtn = app.buttons["Dont have an account? Register"]
        XCTAssert(registerBtn.exists)
    }
    
    func testCheckIfUnLockButtonExists() {
        let lockButton = app.buttons["unlock"]
        XCTAssert(lockButton.exists)
    }
    
    func testCheckIfLoginButtonDisabled() {
        let loginBtn = app.buttons["Login"]
        XCTAssertFalse(loginBtn.isEnabled)
    }
    
}
