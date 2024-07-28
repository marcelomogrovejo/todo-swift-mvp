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
    
    func test_listView_initializationState_shouldSuccess() {
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
    
    func test_listView_updateView_shouldSuccess() {
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
    
    func test_listView_closeView_shouldSuccess() {
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
    
    func test_listView_newTask_shouldSuccess() {
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
    
    // MARK: - Display logic
    
    func test_listView_displayTitle_shouldSuccess() {
        // Arrange
        let mockTitle = "Test Title"
        let mockViewModel = List.Title.ViewModel(title: mockTitle)
        
        // Act
        sut.displayTitle(viewModel: mockViewModel)
        
        // Assert
        XCTAssertEqual(sut.title, mockTitle, "")
    }
    
    func test_listView_displayDeletionConfirmed_shouldSuccess() {
        // Arrange
        let mockTask = Task(id: UUID().uuidString, avatar: "", username: "task", title: "Test Task", date: "\(Date.now)", description: "Test task 1 description", isComplete: false)
        let mockViewModel = List.Remove.ViewModel(task: mockTask)
        
        let mockPresenter = MockListPresenter()
        sut.presenter = mockPresenter
        
        // Act
        // TODO: figure out how to tap OK or Cancel buttons, that
        // way the presenter is called.
        sut.displayDeletionConfirmed(viewModel: mockViewModel)
        
        // Assert
        //        XCTAssertTrue(mockPresenter.isRemoveTaskCalled)
    }
    
    func test_listView_displayTaskRemovalCancellation_shouldSuccess() {
        // Arrange
        let mockTableView = MockTableView()
        sut.tableView = mockTableView
        
        // Act
        sut.displayTaskRemovalCancellation()
        
        // Assert
        XCTAssertTrue(mockTableView.isReloadDataCalled, "reloadData() should be called")
        XCTAssertEqual(mockTableView.numberOfTimesIsCalledRealoadData, 1, "reloadData() should be called once")
    }
    
    func test_listView_displayTaskRemoved_shouldSuccess() {
        // TODO: figure out how to tap OK or Cancel buttons, that
        // way the presenter is called.
        
    }
    
    func test_listView_displayTaskRemoveError_shouldSuccess() {
        // TODO: figure out how to tap OK or Cancel buttons, that
        // way the presenter is called.
        
    }
    
    func test_listView_displayLoadingIndicator_shouldSuccess() {
        // TODO: implement the source code first
    }
    
    func test_listView_hideLoadingIndicator_shouldSuccess() {
        // TODO: implement the source code first
    }
    
    // MARK: - TableView delegate
    
    func test_listView_trailingSwipeActionsConfigurationForRowAt_shouldBeDelete() {
        // Arrange
        let mockAction = "Delete"
        let mockTableView = UITableView()

        // Act
        let mockSwipeActionConfig: UISwipeActionsConfiguration = sut.tableView(mockTableView, trailingSwipeActionsConfigurationForRowAt: .init(row: 0, section: 0)) ?? UISwipeActionsConfiguration()

        // Assert
        XCTAssertEqual(mockSwipeActionConfig.actions[0].title, mockAction, "")
    }

    func test_listView_trailingSwipeActionsConfigurationForRowAt_shouldBeEdit() {
        // Arrange
        let mockAction = "Edit"
        let mockTableView = UITableView()

        // Act
        let mockSwipeActionConfig: UISwipeActionsConfiguration = sut.tableView(mockTableView, trailingSwipeActionsConfigurationForRowAt: .init(row: 0, section: 0)) ?? UISwipeActionsConfiguration()

        // Assert
        XCTAssertEqual(mockSwipeActionConfig.actions[1].title, mockAction, "")
    }

    
}
