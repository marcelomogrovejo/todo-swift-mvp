//
//  MockPresenterTaskView.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import Foundation
@testable import TodoMVP

class MockPresenterTaskView: TaskViewProtocol {

    private(set) var isGetTitleCalled = false
    private(set) var numberOfTimesIsCalledGetTitle = 0
    private(set) var isDisplayFormCalled = false
    private(set) var numberOfTimesIsCalledDisplayForm = 0
    private(set) var isDisplayAddedSuccessfullyCalled = false
    private(set) var numberOfTimesIsCalledDisplayAddedSuccessfully = 0

    func displayTitle(viewModel: TodoMVP.TaskItem.Title.ViewModel) {
        isGetTitleCalled = true
        numberOfTimesIsCalledGetTitle += 1
    }
    
    func displyForm(viewModel: TodoMVP.Form.Init.ViewModel) {
        isDisplayFormCalled = true
        numberOfTimesIsCalledDisplayForm += 1
    }

    func displayAddedSuccessfully(viewModel: TodoMVP.TaskItem.Save.ViewModel) {
        isDisplayAddedSuccessfullyCalled = true
        numberOfTimesIsCalledDisplayAddedSuccessfully += 1
    }

}
