//
//  MainPresenterTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import XCTest
@testable import TodoMVP

// TODO: when it implements a service, it will need this tests

final class MainPresenterTests: XCTestCase {

    var sut: MainPresenterProtocol!
    
    override func setUpWithError() throws {
        sut = MainPresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_mainPresenter_getListTitleButton_shouldSuccess() {
        // Arrange
        let mockMainView = MockMainView()
        sut.view = mockMainView

        // Act
        sut.getListTitleButton()

        // Assert
        XCTAssertTrue(mockMainView.isDisplayButtonTitleCalled,
                      "displayButtonTitle() should be called")
        XCTAssertEqual(mockMainView.numberOfTimesIsCalledGetDisplayButtonTitle, 1,
                       "displayButtonTitle() should be called once")
    }

}
