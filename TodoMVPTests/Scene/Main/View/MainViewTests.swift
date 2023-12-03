//
//  MainViewTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import XCTest
@testable import TodoMVP

class MainViewControllerTests: XCTestCase {

    var window: UIWindow!
    var sut: MainViewController!

    override func setUp() {
        window = UIWindow()
        sut = MainViewController()
    }

    override func tearDown() {
        window = nil
        sut = nil
    }

    func testMainViewController_InitializationState_Successfully() {
        // Arrange
        let mockPresenter = MockMainPresenter()
        sut.presenter = mockPresenter
        window.addSubview(sut.view)

        // Act
        RunLoop.current.run(until: Date())

        // Assert
        XCTAssertTrue(mockPresenter.isGetWellcomeMessageCalled,
                      "getWellcomeMessage() should be called")
        XCTAssertEqual(mockPresenter.numberOfTimesIsCalledGetWellcomeMessage, 1,
                       "getWellcomeMessage() should be called once")
    }
}
