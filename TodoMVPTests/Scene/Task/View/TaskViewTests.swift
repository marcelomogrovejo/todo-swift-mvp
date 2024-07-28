//
//  TaskViewTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import XCTest
@testable import TodoMVP

final class TaskViewTests: XCTestCase {

    var sut: TaskViewController!
    var window: UIWindow!

    override func setUpWithError() throws {
        sut = TaskViewController()
        window = UIWindow()
    }

    override func tearDownWithError() throws {
        sut = nil
        window = nil
    }

    func test_taskView_initializationState_shouldSuccess() {
        // Arrange
        let mockPresenter = MockTaskPresenter()
        sut.presenter = mockPresenter
        window.addSubview(sut.view)

        // Act
        RunLoop.current.run(until: Date())

        // Assert
        XCTAssertTrue(mockPresenter.isGetTitleCalled, "getTitle() should be called")
        XCTAssertEqual(mockPresenter.numberOfTimesIsCalledGetTitle, 1, "getTitle() should be called once")
        XCTAssertTrue(mockPresenter.isInitFormCalled, "initForm() should be called")
        XCTAssertEqual(mockPresenter.numberOfTimesIsCalledInitForm, 1, "initForm() should be called once")
    }

    func test_taskView_cancel_shouldSuccess() {
        // Arrange
        let mockRouter = MockTaskRouter()
        sut.router = mockRouter

        // Act
        sut.cancel()
        
        // Assert
        XCTAssertTrue(mockRouter.isDismissSelfCalled)
        XCTAssertEqual(mockRouter.numberOfTimesIsCalledDismissSelf, 1)
    }

    func test_taskView_addTask_shouldSuccess() {
        // Arrange
        let mockPresenter = MockTaskPresenter()
        sut.presenter = mockPresenter

        // Act
        sut.addTask()

        // Assert
        XCTAssertTrue(mockPresenter.isAddTaskCalled, "addTask() should be called")
        XCTAssertEqual(mockPresenter.numberOfTimesIsCalledAddTask, 1, "addTask() should be called once")
    }

    // MARK: - Display logic

    func test_taskView_displayTitle_shouldSuccess() {
        // Arrange
        let mockTitle = "Test Task Title"
        let mockViewModel = TaskItem.Title.ViewModel(title: mockTitle)

        // Act
        sut.displayTitle(viewModel: mockViewModel)

        // Assert
        XCTAssertEqual(sut.title, mockTitle, "")
    }

    func test_taskView_displayForm_shouldSuccess() {
        // Arrange
        let mockTableView = MockTableView()
        sut.tableView = mockTableView
        let mockViewModel = Form.Init.ViewModel(dataSource: ["", "", "", ""])

        // Act
        sut.displyForm(viewModel: mockViewModel)

        // Assert
        XCTAssertTrue(mockTableView.isReloadDataCalled, "reloadData() should be called")
        XCTAssertEqual(mockTableView.numberOfTimesIsCalledRealoadData, 1, "reloadData() should be called once")
    }

    func test_taskView_displayAddedSuccessfully_shouldSuccess() {
        // Arrange
        // TODO: figure out how to tap OK or Cancel buttons, that
        // way the presenter is called.

    }

    // MARK: - TableView delegate

    func test_taskView_heighForRowAt_shouldBe50() {
        // Arrange
        let mockTableView = UITableView()
        let definedCellHeight = TaskViewController.TableViewConstants.cellHeight

        // Act
        let heightForRowAt = sut.tableView(mockTableView, heightForRowAt: .init(row: 0, section: 0))

        // Assert
        XCTAssertEqual(heightForRowAt, definedCellHeight, "heightForRowAt() should be \(definedCellHeight)")
    }

    func test_taskView_heightForHeaderInSection_shouldBe20() {
        // Arrange
        let mockTableView = UITableView()
        let definedHeaderHeight = TaskViewController.TableViewConstants.headerCellHeight

        // Act
        let heightForHeaderInSection = sut.tableView(mockTableView, heightForHeaderInSection: 0)

        // Assert
        XCTAssertEqual(heightForHeaderInSection, definedHeaderHeight, "heightForHeaderInSection() should be \(definedHeaderHeight)")
    }

    func test_taskView_heightForFooterInSection_shouldBeLastNormalMagnitude() {
        // Arrange
        let mockTableView = UITableView()
        let definedFooterHeight = TaskViewController.TableViewConstants.footerCellHeight

        // Act
        let heightForFooterInSection = sut.tableView(mockTableView, heightForFooterInSection: 0)

        // Assert
        XCTAssertEqual(heightForFooterInSection, definedFooterHeight, "heightForFooterInSection() should be \(definedFooterHeight)")
    }

    func test_taskView_viewForHeaderInSection_shouldSuccess() {
        // Arrange
        let mockTableView = UITableView()

        // Act
        let viewForHeader = sut.tableView(mockTableView, viewForHeaderInSection: 0)

        // Assert
        XCTAssertNotNil(viewForHeader)
    }

    func test_taskView_viewForFooterInSection_shouldSuccess() {
        // Arrange
        let mockTableView = UITableView()

        // Act
        let viewForFooter = sut.tableView(mockTableView, viewForFooterInSection: 0)

        // Assert
        XCTAssertNotNil(viewForFooter)
    }
}

