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

    override func setUpWithError() throws {
        window = UIWindow()
        sut = MainViewController()
    }

    override func tearDownWithError() throws {
        window = nil
        sut = nil
    }

    func test_mainView_initializationState_shouldSuccess() {
        // Arrange
        let mockPresenter = MockMainPresenter()
        sut.presenter = mockPresenter
        window.addSubview(sut.view)

        // Act
        RunLoop.current.run(until: Date())

        // Assert
        XCTAssertTrue(mockPresenter.isGetListTitleButtonCalled,
                      "getWellcomeMessage() should be called")
        XCTAssertEqual(mockPresenter.numberOfTimesIsCalledGetListTitleButton, 1,
                       "getWellcomeMessage() should be called once")
    }

}
