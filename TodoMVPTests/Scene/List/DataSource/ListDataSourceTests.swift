//
//  ListDataSourceTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import XCTest
@testable import TodoMVP

class ListDataSourceTests: XCTestCase {

    var sut: ListDataSource!
    var mockTableView: UITableView!

    override func setUpWithError() throws {
        sut = ListDataSource()
        mockTableView = UITableView()
    }

    override func tearDownWithError() throws {
        sut = nil
        mockTableView = nil
    }

    func test_listDataSource_numberOfSections_shouldBeOne() {
        // Arrange
        mockTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ListDataSource.Constants.cellId)
        let mockTasks: [Task] = getMockedTasks(cant: 5)
        sut.tasks = mockTasks

        // Act
        let numberOfSections = sut.numberOfSections(in: mockTableView)

        // Assert
        XCTAssertEqual(numberOfSections, 1)
    }

    func test_listDataSource_numberOfRows_shouldBeFive() {
        // Arrange
        mockTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ListDataSource.Constants.cellId)
        let mockTasksCant = 3
        let mockTasks: [Task] = getMockedTasks(cant: mockTasksCant)
        sut.tasks = mockTasks

        // Act
        let numberOfRowsInSection = sut.tableView(mockTableView, numberOfRowsInSection: 1)

        // Assert
        XCTAssertEqual(mockTasksCant + 1, numberOfRowsInSection)
    }

    func test_listDataSource_cellForRowAt_shouldReturnAnItemCell() {
        // Arrange
        mockTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ListDataSource.Constants.cellId)
        let mockTasks: [Task] = getMockedTasks(cant: 5)
        sut.tasks = mockTasks

        // Act
        let cell0 = sut.tableView(mockTableView, cellForRowAt: .init(row: 3, section: 0))

        // Assert
        XCTAssertTrue(cell0 is ItemTableViewCell)
    }
}

extension ListDataSourceTests {

    func getMockedTasks(cant: Int = 1) -> [Task] {
        var tasks: [Task] = []
        for i in 0...cant {
            let task = Task(id: UUID().uuidString,
                            avatar: "",
                            username: "task\(i)",
                            title: "Test Task \(i)",
                            date: "\(Date.now)",
                            description: "Test Task \(i) description",
                            isComplete: false)
            tasks.append(task)
        }
        return tasks
    }
}
