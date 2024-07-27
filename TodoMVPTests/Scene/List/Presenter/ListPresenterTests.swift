//
//  ListPresenterTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 27/07/2024.
//

import XCTest
@testable import TodoMVP

final class ListPresenterTests: XCTestCase {

    var sut: ListPresenter!
    var mockListView: MockListView!

    override func setUpWithError() throws {
        sut = ListPresenter()
        mockListView = MockListView()
    }

    override func tearDownWithError() throws {
        sut = nil
        mockListView = nil
    }

    func testListPresenter_GetTitle_Successfully() {
        // Arrange
        sut.view = mockListView

        // Act
        sut.getTitle()

        // Assert
        XCTAssertTrue(mockListView.isDisplayTitleCalled, "displayTitle() should be called")
        XCTAssertEqual(mockListView.numberOfTimesIsCalledDisplayTitle, 1, "displayTitle() should be called once")
    }

    func testListPresenter_FetchTaskList_Successfully() {
        // Arrange
        sut.view = mockListView
        let expectation = expectation(description: "fetching tasks expectation on success")
        let mockApiService = MockApiService(expectation: expectation)
        sut.apiService = mockApiService

        // Act
        sut.fetchTaskList()

        // Assert
        wait(for: [expectation], timeout: 2.0)

        XCTAssertTrue(mockListView.isDisplayListItemsCalled)
        XCTAssertEqual(mockListView.numberOfTimesIsCalledDisplayListItems, 1)
    }

    func testListPresenter_FetchTaskList_Failure() {
        // Arrange
        sut.view = mockListView
        let expectation = expectation(description: "fetching tasks expectation on failure")
        let mockApiService = MockApiService(success: false, expectation: expectation, error: .notFound)
        sut.apiService = mockApiService

        // Act
        sut.fetchTaskList()

        // Assert
        wait(for: [expectation], timeout: 2.0)

//        XCTAssertTrue(mockListView.isDisplayListItemsCalled)
//        XCTAssertEqual(mockListView.numberOfTimesIsCalledDisplayListItems, 1)
    }

    func testListPresenter_NewTask_Successfully() {
        // Arrange
        let mockTask = Task(id: UUID().uuidString,
                        avatar: "",
                        username: "task",
                        title: "Test Task",
                        date: "\(Date.now)",
                        description: "Test task 1 description",
                        isComplete: false)
        let mockRequest = List.New.Request(task: mockTask)

        // Act
        sut.newTask(request: mockRequest)

        // Assert
//        XCTAssertTrue(<#T##expression: Bool##Bool#>)
//        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
    }

    func testListPresenter_UpdateTask_Successfully() {
        // Arrange
        let mockTask = Task(id: UUID().uuidString,
                        avatar: "",
                        username: "task",
                        title: "Test Task",
                        date: "\(Date.now)",
                        description: "Test task 1 description",
                        isComplete: false)
        let mockRequest = List.Update.Request(task: mockTask)

        // Act
        sut.updateTask(request: mockRequest)
        // Assert
//        XCTAssertTrue(<#T##expression: Bool##Bool#>)
//        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
    }

    func testListPresenter_GetRemoveConfirmation_Successfully() {
        // Arrange
        sut.view = mockListView
        let mockTask = Task(id: UUID().uuidString,
                        avatar: "",
                        username: "task",
                        title: "Test Task",
                        date: "\(Date.now)",
                        description: "Test task 1 description",
                        isComplete: false)
        let mockRequest = List.Remove.Request(task: mockTask)

        // Act
        sut.getRemoveConfirmation(request: mockRequest)

        // Assert
        XCTAssertTrue(mockListView.isDisplayDeletionConfirmedCalled, "displayDeletionConfirmed() should be called")
        XCTAssertEqual(mockListView.numberOfTimesIsCalledDisplayDeletionConfirmed, 1, "displayDeletionConfirmed() should be called once")
    }

    func testListPresenter_CancelTaskRemoval_Successfully() {
        // Arrange
        sut.view = mockListView

        // Act
        sut.cancelTaskRemoval()

        // Assert
        XCTAssertTrue(mockListView.isDisplayTaskRemovalCancellationCalled, "displayTaskRemovalCancellation() should be called")
        XCTAssertEqual(mockListView.numberOfTimesIsCalledDisplayTaskRemovalCancellation, 1, "displayTaskRemovalCancellation() should be called once")
    }

    func testListPresenter_RemoveTask_Successfully() {
        // Arrange
        sut.view = mockListView
        let expectation = expectation(description: "Removing task expectation on success")
        let mockApiService = MockApiService(expectation: expectation)
        sut.apiService = mockApiService
        let mockTask = Task(id: UUID().uuidString,
                        avatar: "",
                        username: "task",
                        title: "Test Task",
                        date: "\(Date.now)",
                        description: "Test task 1 description",
                        isComplete: false)
        let mockRequest = List.Remove.Request(task: mockTask)

        // Act
        sut.removeTask(request: mockRequest)

        // Assert
        wait(for: [expectation], timeout: 2.0)

        XCTAssertTrue(mockListView.isDisplayTaskRemovedCalled, "displayTaskRemoved() should be called")
        XCTAssertEqual(mockListView.numberOfTimesIsCalledDisplayTaskRemoved, 1, "displayTaskRemoved() should be called once")
    }

    func testListPresenter_RemoveTask_Failure() {
        // Arrange
        sut.view = mockListView
        let expectation = expectation(description: "Removing task expectation on failure")
        let mockApiService = MockApiService(success: false, expectation: expectation, error: .notFound)
        sut.apiService = mockApiService
        let mockTask = Task(id: UUID().uuidString,
                        avatar: "",
                        username: "task",
                        title: "Test Task",
                        date: "\(Date.now)",
                        description: "Test task 1 description",
                        isComplete: false)
        let mockRequest = List.Remove.Request(task: mockTask)

        // Act
        sut.removeTask(request: mockRequest)

        // Assert
        wait(for: [expectation], timeout: 2.0)

        XCTAssertTrue(mockListView.isDisplayTaskRemoveErrorCalled, "displayTaskRemoved() should be called")
        XCTAssertEqual(mockListView.numberOfTimesIsCalledDisplayTaskRemoveError, 1, "displayTaskRemoved() should be called once")
    }

}
