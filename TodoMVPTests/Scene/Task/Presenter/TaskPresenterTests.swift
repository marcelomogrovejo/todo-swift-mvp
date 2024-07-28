//
//  TaskPresenterTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import XCTest
@testable import TodoMVP

final class TaskPresenterTests: XCTestCase {
    
    var sut: TaskPresenter!
    
    override func setUpWithError() throws {
        sut = TaskPresenter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_taskPresenter_getTitle_shouldSuccess() {
        // Arrange
        let mockTaskView = MockPresenterTaskView()
        sut.view = mockTaskView
        
        // Act
        sut.getTitle()
        
        // Assert
        XCTAssertTrue(mockTaskView.isGetTitleCalled)
    }
    
    func test_taskPresenter_initForm_shouldSuccess() {
        // Arrange
        let mockTaskView = MockPresenterTaskView()
        sut.view = mockTaskView
        
        // Act
        sut.initForm()
        
        // Assert
        XCTAssertTrue(mockTaskView.isDisplayFormCalled)
        XCTAssertEqual(mockTaskView.numberOfTimesIsCalledDisplayForm, 1)
    }
    
    func test_taskPresenter_addTask_shouldSuccess() {
        // Arrange
        let mockTaskView = MockPresenterTaskView()
        sut.view = mockTaskView
        let expectation = expectation(description: "Adding task expectation on success")
        let mockApiService = MockApiService(expectation: expectation)
        sut.apiService = mockApiService
        let mockRequest = TaskItem.Save.Request(dataSource: ["", "", "", ""])
        
        // Act
        sut.addTask(request: mockRequest)
        
        // Assert
        wait(for: [expectation], timeout: 2.0)
        
        XCTAssertTrue(mockApiService.isNewCalled, "new() should be called")
        XCTAssertEqual(mockApiService.numberOfTimesIsCalledNew, 1, "new() should be called once")
        XCTAssertTrue(mockTaskView.isDisplayAddedSuccessfullyCalled, "displayTaskRemoved() should be called")
        XCTAssertEqual(mockTaskView.numberOfTimesIsCalledDisplayAddedSuccessfully, 1, "displayTaskRemoved() should be called once")
    }

    func test_taskPresenter_addTask_shouldFail() {
        // Arrange
        let mockTaskView = MockPresenterTaskView()
        sut.view = mockTaskView
        let expectation = expectation(description: "Adding task expectation on fail")
        let mockApiService = MockApiService(success: false, expectation: expectation, error: .notFound)
        sut.apiService = mockApiService
        let mockRequest = TaskItem.Save.Request(dataSource: ["", "", "", ""])

        // Act
        sut.addTask(request: mockRequest)

        // Assert
        wait(for: [expectation], timeout: 2.0)

        XCTAssertTrue(mockApiService.isNewCalled, "new() should be called")
        XCTAssertEqual(mockApiService.numberOfTimesIsCalledNew, 1, "new() should be called once")
        
        // TODO:
        XCTAssertFalse(mockTaskView.isDisplayAddedSuccessfullyCalled, "displayTaskRemoved() should NOT be called")
        XCTAssertEqual(mockTaskView.numberOfTimesIsCalledDisplayAddedSuccessfully, 0, "displayTaskRemoved() should NOT be called once")
    }

}
