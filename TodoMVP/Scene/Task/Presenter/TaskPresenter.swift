//
//  TaskPresenter.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import Foundation
import TodoRepositoryPackage

class TaskPresenter: TaskPresenterProtocol {

    // MARK: - Properties

    weak var view: TaskViewProtocol?
    var apiService: ApiServiceProtocol?

    // MARK: - Business logic

    func getTitle() {
        let viewModel = TaskItem.Title.ViewModel(title: "New ToDo Task")
        view?.displayTitle(viewModel: viewModel)
    }

    func initForm() {
        let viewModel = Form.Init.ViewModel(dataSource: Array(repeating: "", count: TaskCellType.allCases.count))
        view?.displyForm(viewModel: viewModel)
    }


}
