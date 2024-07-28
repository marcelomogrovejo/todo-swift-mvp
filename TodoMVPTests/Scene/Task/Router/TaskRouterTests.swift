//
//  TaskRouterTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import XCTest
@testable import TodoMVP

final class TaskRouterTests: XCTestCase {

    var sut: TaskRouter!

    override func setUpWithError() throws {
        sut = TaskRouter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_taskRouter_dismissSelf_should() {
        // Arrange
        let mockTaskView = MockTaskView()

        // Act
        sut.dismissSelf(taskViewController: mockTaskView)

        // Assert
        XCTAssertTrue(mockTaskView.isDismissCalled)
        XCTAssertEqual(mockTaskView.numberOfTimesIsCalledDismiss, 1)
    }
}
