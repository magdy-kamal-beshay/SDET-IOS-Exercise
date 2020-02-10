//
//  RXTableViewUITests.swift
//  LoginDemoRxReduxUITests
//
//  Created by Magdy Kamal on 2/10/20.
//  Copyright © 2020 Mounir Dellagi. All rights reserved.
//

import XCTest
@testable import LoginDemoRxRedux

class RXTableViewUITests: BaseUITestClass {
    
    override func setUp() {
        super.setUp()
        openRxTableView()
    }
    
    func openRxTableView() {
        enterValidUserNameAndPassword()
        app.buttons["Login"].tap()
    }
    
    func testCheckIfLoaderExists() {
        let activityIndicator = app.activityIndicators["RxTableViewActivityIndictor"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: activityIndicator, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testCheckIfTableViewExists() {
        let exists = NSPredicate(format: "exists == 1")
        let tableView = app.tables["RxTableView"]
        expectation(for: exists, evaluatedWith: tableView, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testCheckIfRefreshButtonExists() {
        let exists = NSPredicate(format: "exists == 1")
        let refreshBtn = app.buttons["Refresh"]
        expectation(for: exists, evaluatedWith: refreshBtn, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    // as i have checked the code it choses 5 random charcters
    func testCheckIf5TableViewCellsExists() {
        let counts = NSPredicate(format: "count == 5")
        let cells = app.tables["RxTableView"].cells
        expectation(for: counts, evaluatedWith: cells, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testCharacterTitleLabelExists() {
        let exists = NSPredicate(format: "exists == 1")
        let firstCell = app.tables["RxTableView"].cells.element(boundBy: 0)
        let titleLabel = firstCell.staticTexts["characterTitleLabel"]
        expectation(for: exists, evaluatedWith: titleLabel, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testCharacterDescriptionLabelExists() {
        let exists = NSPredicate(format: "exists == 1")
        let firstCell = app.tables["RxTableView"].cells.element(boundBy: 0)
        let descriptionLabel = firstCell.staticTexts["characterDescriptionLabel"]
        expectation(for: exists, evaluatedWith: descriptionLabel, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testCharacterImageViewExists() {
        let exists = NSPredicate(format: "exists == 1")
        let firstCell = app.tables["RxTableView"].cells.element(boundBy: 0)
        let imageView = firstCell.images["characterImageView"]
        expectation(for: exists, evaluatedWith: imageView, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testRefreshAction() {
        let tableView = app.tables["RxTableView"]
        XCTAssert(tableView.waitForExistence(timeout: 10))
        let refreshBtn = app.buttons["Refresh"]
        refreshBtn.tap()
        let activityIndicator = app.activityIndicators["RxTableViewActivityIndictor"]
        XCTAssert(activityIndicator.exists)
        let counts = NSPredicate(format: "count == 5")
        let cells = app.tables["RxTableView"].cells
        expectation(for: counts, evaluatedWith: cells, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
