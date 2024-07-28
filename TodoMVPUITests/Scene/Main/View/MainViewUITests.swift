//
//  MainViewUITests.swift
//  TodoMVPUITests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import XCTest
@testable import TodoMVP

final class MainViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
        try super.tearDownWithError()
    }

    func test_mainView_initialization_shouldSucced() {
        let navigationBarElement = app.navigationBars["com.mogro.todomvp.mainScreen.navigationBar"]
        XCTAssertTrue(navigationBarElement.exists)

        let animationElement = app.otherElements["com.mogro.todomvp.mainScreen.mainAnimation"]
        XCTAssertTrue(animationElement.exists)

        let mainButtonElement = app.buttons["com.mogro.todomvp.mainScreen.mainButton"]
        XCTAssertTrue(mainButtonElement.exists)
    }

    func test_mainView_tapMainButton_shouldNavigate_() {
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Todo List"]/*[[".buttons[\"Todo List\"].staticTexts[\"Todo List\"]",".buttons[\"com.mogro.todomvp.mainScreen.mainButton\"].staticTexts[\"Todo List\"]",".staticTexts[\"Todo List\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["ToDo List"]/*@START_MENU_TOKEN@*/.buttons["com.mogro.todomvp.listScreen.close"]/*[[".buttons[\"Stop\"]",".buttons[\"com.mogro.todomvp.listScreen.close\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // TODO: - 
    }
    
}
