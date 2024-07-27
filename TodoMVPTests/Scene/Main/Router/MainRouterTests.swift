//
//  MainRouterTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 23/07/2024.
//

import XCTest
@testable import TodoMVP

final class MainRouterTests: XCTestCase {

    var sut: MainRouterProtocol!

    override func setUpWithError() throws {
        sut = MainRouter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testMainRouter_NavigateToTodoList_Successfully() {
        // Arrange
        let mockDestinationFactory = MockListFactory()
        let mockDestinationVC = mockDestinationFactory.createScene()

        // Act
        sut.navigateToTodoList(view: mockDestinationVC)

        // Assert
        XCTAssertTrue(mockDestinationFactory.isCreateSceneCalled,
                      "createScene() should be called")
        XCTAssertEqual(mockDestinationFactory.numberOfTimesIsCalledCreateScene, 1,
                       "createScene() should be called once")
    }
}
