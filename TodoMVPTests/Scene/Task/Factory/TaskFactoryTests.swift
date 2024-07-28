//
//  TaskFactoryTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import XCTest
@testable import TodoMVP
@testable import TodoRepositoryPackage

final class TaskFactoryTests: XCTestCase {

    var sut: TaskFactory!

    override func setUpWithError() throws {
        sut = TaskFactory()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_taskFactory_createScene_shouldReturnAView() {
        // Arrange
        let mockTaskView = TaskViewController()
        let mockTaskPresenter = TaskPresenter()
        let mockTaskRouter = TaskRouter()
        let mockApiService = ApiService()

        mockTaskView.presenter = mockTaskPresenter
        mockTaskView.router = mockTaskRouter

        mockTaskPresenter.view = mockTaskView
        mockTaskPresenter.apiService = mockApiService

        // Act
        let view = sut.createScene()
        
        // Assert
        XCTAssertTrue(view is TaskViewController)
    }
}
