//
//  LoginViewUITests.swift
//  LoginViewUITests
//
//  Created by Magdy Kamal on 2/8/20.
//  Copyright © 2020 Mounir Dellagi. All rights reserved.
//

import XCTest
@testable import LoginDemoRxRedux

class LoginViewUITests: BaseUITestClass {

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
    
    func testCheckIfLockButtonExists() {
        app.buttons["unlock"].tap()
        let lockButton = app.buttons["lock"]
        XCTAssert(lockButton.exists)
    }
    
    func testCheckIfLoaderExists() {
        enterInValidUserNameAndPassword()
        app.buttons["Login"].tap()
        let activityIndicator = app.activityIndicators["loadingIndicatior"]
        XCTAssert(activityIndicator.exists)
    }
    
    func testCheckIfLoginButtonDisabled() {
        let loginBtn = app.buttons["Login"]
        XCTAssertFalse(loginBtn.isEnabled)
    }
    
    func testCheckIfLoginButtonDisabledWhenUserNameLessThan5CharactersAndPasswordLessThan7Characters() {
        enterUsernameAndPassword(userName: "Firs", password: "First")
        let loginBtn = app.buttons["Login"]
        XCTAssertFalse(loginBtn.isEnabled)
    }
    
    func testIfLoginButtonEnabled() {
        enterInValidUserNameAndPassword()
        let loginBtn = app.buttons["Login"]
        XCTAssertTrue(loginBtn.isEnabled)
    }
    
    func testCheckIfLoginButtonEnabledWhenUserNameMoreThan5CharactersAndPasswordMoreThan7Characters() {
        enterInValidUserNameAndPassword()
        let loginBtn = app.buttons["Login"]
        XCTAssertTrue(loginBtn.isEnabled)
    }
    
    func testCheckIfPasswordIsEncypted() {
        enterInValidUserNameAndPassword()
        let password = app.secureTextFields["Password"]
        XCTAssert(password.value as! String  == "•••••••••••••")
    }
    
    func testCheckIfUnLockButtonMakePasswordReadable() {
        enterInValidUserNameAndPassword()
        let password = app.textFields["Password"]
        app.buttons["unlock"].tap()
        XCTAssert(password.value as! String  == "FirstPassword")
    }
    
    func testLoginFailure() {
        enterInValidUserNameAndPassword()
        app.buttons["Login"].tap()
        let exists = NSPredicate(format: "exists == 1")
        let alert = app.alerts["An unowned Error occured"]
        expectation(for: exists, evaluatedWith: alert, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
 
    func testLoginSuccess() {
        enterValidUserNameAndPassword()
        app.buttons["Login"].tap()
        let navBarTitle = app.navigationBars["Rx TableView Example"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: navBarTitle, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
