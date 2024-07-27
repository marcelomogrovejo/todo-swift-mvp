//
//  ListViewTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 23/07/2024.
//

import XCTest
@testable import TodoMVP

final class ListViewTests: XCTestCase {

    var window: UIWindow!
    var sut: ListViewController!

    override func setUpWithError() throws {
        window = UIWindow()
        sut = ListViewController()
    }

    override func tearDownWithError() throws {
        window = nil
        sut = nil
    }

    func testListViewController_InitializationState_Successfully() {
        // Arrange
        let mockPresenter = MockListPresenter()
        sut.presenter = mockPresenter
        window.addSubview(sut.view)

        // Act
        RunLoop.current.run(until: Date())

        // Assert
        XCTAssertTrue(mockPresenter.isGetTitleCalled, 
                      "getTitle() should be called")
        XCTAssertEqual(mockPresenter.numberOfTimesIsCalledGetTitle, 1, 
                       "getTitle() should be called once")
        XCTAssertTrue(mockPresenter.isFetchTaskListCalled, 
                      "fetchTaskList() should be called")
        XCTAssertEqual(mockPresenter.numberOfTimesIsCalledFetchTaskList, 1, 
                       "fetchTaskList() should be called once")
    }

    func testListViewController_UpdateView_Successfully() {
        // Arrange
        let mockPresenter = MockListPresenter()
        sut.presenter = mockPresenter

        // Act
        sut.updateView()

        // Assert
        XCTAssertTrue(mockPresenter.isFetchTaskListCalled, 
                      "fetchTaskList() should be called")
        XCTAssertEqual(mockPresenter.numberOfTimesIsCalledFetchTaskList, 1, 
                       "fetchTaskList() should be called once")
    }

    func testListViewController_CloseView_Successfully() {
        // Arrange
        let mockRouter = MockListRouter()
        sut.router = mockRouter

        // Act
        sut.close()

        // Assert
        XCTAssertTrue(mockRouter.isDismissSelfCalled,
                      "dismissSelf() should be called")
        XCTAssertEqual(mockRouter.numberOfTimesIsCalledDismissSelf, 1,
                       "dismissSelf() should be called once")
    }

    func testListViewController_NewTask_Successfully() {
        // Arrange
        let mockRouter = MockListRouter()
        sut.router = mockRouter

        // Act
        sut.newTask()

        // Assert
        XCTAssertTrue(mockRouter.isNavigateToTaskCalled,
                      "navigateToTask() should be called")
        XCTAssertEqual(mockRouter.numberOfTimesIsCalledNavigateToTask, 1,
                       "navigateToTask() should be called once")
    }

}
