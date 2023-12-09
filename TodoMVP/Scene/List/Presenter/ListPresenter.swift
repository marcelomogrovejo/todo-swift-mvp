//
//  ListPresenter.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 23/09/2023.
//

import Foundation
import TodoRepositoryPackage

class ListPresenter: ListPresenterProtocol {

    // MARK: - Properties

    weak var view: ListViewProtocol?
    var apiService: ApiServiceProtocol?

    // MARK: - Business logic

    func getTitle() {
        let viewModel = List.Title.ViewModel(title: "ToDo List")
        view?.displayTitle(viewModel: viewModel)
    }

    func fetchTaskList() {
        apiService?.getAll() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let domainTodoTasks):
                let tasks = domainTodoTasks.map{
                    Task(id: $0.id,
                         avatar: $0.avatar,
                         username: $0.username,
                         title: $0.title,
                         date: $0.date.stringyfiedFullDate,
                         description: $0.description,
                         isComplete: $0.isCompleted)
                }
                let viewModel = List.Tasks.ViewModel(tasks: tasks)
                self.view?.displayListItems(viewModel: viewModel)
            case .failure(let repositoryError):
                // TODO: implement
                print("Error: \(repositoryError.localizedDescription)")
            }
        }
    }

//    func fetchAvatar(request: List.Avatar.Request, completion: @escaping (Data?) -> Void) {
//
//        // TODO: loading indicator or skeleton
//
//        apiService?.getAvatar(url: request.url) { result in
//
//            // TODO: turn of loading
//
//            switch result {
//            case .success(let data):
//                completion(data)
//            case .failure(let listPostsError):
//                debugPrint(listPostsError.errorDescription as Any)
//                break
//            }
//        }
//    }

    func newTask(request: List.New.Request) {
        // TODO: implement
    }

    func updateTask(request: List.Update.Request) {
        // TODO: implement
    }

    func getRemoveConfirmation(request: List.Remove.Request) {
        let viewModel = List.Remove.ViewModel(task: request.task)
        view?.displayDeletionConfirmed(viewModel: viewModel)
    }

    func cancelTaskRemoval() {
        view?.displayTaskRemovalCancellation()
    }

    func removeTask(request: List.Remove.Request) {
        let domainTodoTask = DomainTodoTask(id: request.task.id,
                                            avatar: request.task.avatar ?? "",
                                            username: request.task.username,
                                            title: request.task.title,
                                            date: request.task.date.fullFormattedDate,
                                            description: request.task.description
        )
        apiService?.delete(domainTodoTask) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(_ ):
                self.view?.displayTaskRemoved()
            case .failure(let error):
                print("Error deleting: \(error.localizedDescription)")
                self.view?.displayTaskRemoveError()
            }
        }
    }

}
