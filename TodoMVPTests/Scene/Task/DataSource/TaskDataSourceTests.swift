//
//  TaskDataSourceTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import XCTest
@testable import TodoMVP

final class TaskDataSourceTests: XCTestCase {

    var sut: TaskDataSource!
    var mockTableView: UITableView!

    override func setUpWithError() throws {
        sut = TaskDataSource()
        mockTableView = UITableView()
    }

    override func tearDownWithError() throws {
        sut = nil
        mockTableView = nil
    }

    func test_taskDataSource_numberOfSections_shouldBe4() {
        // Arrange
        mockTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskDataSource.Constants.tableCellId)
        let mockTask: [String] = Array(repeating: "", count: TaskCellType.allCases.count)
        sut.data = mockTask

        // Act
        let numberOfSections = sut.numberOfSections(in: mockTableView)

        // Assert
        XCTAssertEqual(numberOfSections, 4)
    }

    func test_taskDataSource_numberOfRows_shouldBe1() {
        // Arrange
        mockTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskDataSource.Constants.tableCellId)
        let mockTaskItems: [String] = Array(repeating: "", count: TaskCellType.allCases.count)
        sut.data = mockTaskItems

        // Act
        let numberOfRowsInSection = sut.tableView(mockTableView, numberOfRowsInSection: 1)

        // Assert
        XCTAssertEqual(mockTaskItems[0].isEmpty ? 1 : 0, numberOfRowsInSection)
    }

    func test_taskDataSource_cellForRowAt_shouldReturnAnItemCell() {
        // Arrange
        mockTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskDataSource.Constants.tableCellId)
        let mockTaskItems: [String] = Array(repeating: "", count: TaskCellType.allCases.count)
        sut.data = mockTaskItems

        // Act
        let cell0 = sut.tableView(mockTableView, cellForRowAt: .init(row: 3, section: 0))

        // Assert
        XCTAssertTrue(cell0 is TaskTableViewCell)
    }

}
