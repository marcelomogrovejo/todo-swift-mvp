//
//  MockTaskPresenter.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import Foundation
@testable import TodoMVP
@testable import TodoRepositoryPackage

class MockTaskPresenter: TaskPresenterProtocol {

    var view: TaskViewProtocol?
    var apiService: ApiServiceProtocol?

    private(set) var isGetTitleCalled = false
    private(set) var numberOfTimesIsCalledGetTitle = 0
    private(set) var isInitFormCalled = false
    private(set) var numberOfTimesIsCalledInitForm = 0
    private(set) var isAddTaskCalled = false
    private(set) var numberOfTimesIsCalledAddTask = 0

    func getTitle() {
        isGetTitleCalled = true
        numberOfTimesIsCalledGetTitle += 1
    }
    
    func initForm() {
        isInitFormCalled = true
        numberOfTimesIsCalledInitForm += 1
    }
    
    func addTask(request: TodoMVP.TaskItem.Save.Request) {
        isAddTaskCalled = true
        numberOfTimesIsCalledAddTask += 1
    }

}
