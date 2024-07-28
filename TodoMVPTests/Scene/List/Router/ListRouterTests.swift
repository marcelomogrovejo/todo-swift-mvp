//
//  ListRouterTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 27/07/2024.
//

import XCTest
@testable import TodoMVP

final class ListRouterTests: XCTestCase {

    var sut: ListRouter!

    override func setUpWithError() throws {
        sut = ListRouter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_listRouter_navigateToTask_shouldSuccess() {
        
    }

    func test_listRouter_dismissSelf_shouldSuccess() {
        // Arrange
        let mockListView = MockListViewController()

        // Act
        sut.dismissSelf(listViewController: mockListView)

        // Assert
        XCTAssertTrue(mockListView.isDismissCalled)
        XCTAssertEqual(mockListView.numberOfTimesIsCalledDismiss, 1)

    }
}
