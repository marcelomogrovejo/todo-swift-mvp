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

    func addTask(request: TaskItem.Save.Request) {
        print("Saving...")
        let todoTask = DomainTodoTask(id: UUID().uuidString,
                                      avatar: "",
                                      username: "mogro",
                                      title: request.dataSource[0],
                                      date: "\(request.dataSource[2]) \(request.dataSource[3])",
                                      description: request.dataSource[1],
                                      isCompleted: false)
        apiService?.new(todoTask) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(_ ):
                let viewModel = TaskItem.Save.ViewModel()
                self.view?.displayAddedSuccessfully(viewModel: viewModel)
            case .failure(let error):
                // TODO: implement alert to display some error
                print("Adding Error: \(error.localizedDescription)")
            }
        }
    }

}
