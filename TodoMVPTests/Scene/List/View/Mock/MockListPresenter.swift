//
//  MockListPresenter.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 23/07/2024.
//

import Foundation
@testable import TodoMVP
@testable import TodoRepositoryPackage

class MockListPresenter: ListPresenterProtocol {

    var view: (any ListViewProtocol)?
    var apiService: (any ApiServiceProtocol)?

    private(set) var isGetTitleCalled = false
    private(set) var numberOfTimesIsCalledGetTitle = 0
    private(set) var isFetchTaskListCalled = false
    private(set) var numberOfTimesIsCalledFetchTaskList = 0
    private(set) var isNewTaskCalled = false
    private(set) var numberOfTimesIsCalledNewTask = 0
    private(set) var isUpdateTaskCalled = false
    private(set) var numberOfTimesIsCalledUpdateTask = 0
    private(set) var isGetRemoveConfirmationCalled = false
    private(set) var numberOfTimesIsCalledGetRemoveConfirmation = 0
    private(set) var isCancelTaskRemovalCalled = false
    private(set) var numberOfTimesIsCalledCancelTaskRemoval = 0
    private(set) var isRemoveTaskCalled = false
    private(set) var numberOfTimesIsCalledRemoveTask = 0

    func getTitle() {
        isGetTitleCalled = true
        numberOfTimesIsCalledGetTitle += 1
    }
    
    func fetchTaskList() {
        isFetchTaskListCalled = true
        numberOfTimesIsCalledFetchTaskList += 1
    }
    
    func newTask(request: TodoMVP.List.New.Request) {
        isNewTaskCalled = true
        numberOfTimesIsCalledNewTask += 1
    }
    
    func updateTask(request: TodoMVP.List.Update.Request) {
        isUpdateTaskCalled = true
        numberOfTimesIsCalledUpdateTask += 1
    }
    
    func getRemoveConfirmation(request: TodoMVP.List.Remove.Request) {
        isGetRemoveConfirmationCalled = true
        numberOfTimesIsCalledGetRemoveConfirmation += 1
    }
    
    func cancelTaskRemoval() {
        isCancelTaskRemovalCalled = true
        numberOfTimesIsCalledCancelTaskRemoval += 1
    }
    
    func removeTask(request: TodoMVP.List.Remove.Request) {
        isRemoveTaskCalled = true
        numberOfTimesIsCalledRemoveTask += 1
    }

}
