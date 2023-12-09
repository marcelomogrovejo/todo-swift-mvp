//
//  ListProtocol.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 23/09/2023.
//

import UIKit
import TodoRepositoryPackage

protocol ListViewProtocol: AnyObject {
    func displayListItems(viewModel: List.Tasks.ViewModel)
//    func displayPopup(viewModel: List.Error.ViewModel)
    func displayDeletionConfirmed(viewModel: List.Remove.ViewModel)
    func displayTaskRemoved()
    func displayTaskRemovalCancellation()
    func displayTaskRemoveError()
    func displayTitle(viewModel: List.Title.ViewModel)
    func displayLoadingIndicator()
    func hideLoadingIndicator()
}

protocol ListPresenterProtocol: AnyObject {
    var view: ListViewProtocol? { get set }
    var apiService: ApiServiceProtocol? { get set }

    func getTitle()
    func fetchTaskList()
//    func fetchAvatar(request: List.Avatar.Request, completion: @escaping (Data?) -> Void)
    func newTask(request: List.New.Request)
    func updateTask(request: List.Update.Request)
    func getRemoveConfirmation(request: List.Remove.Request)
    func cancelTaskRemoval()
    func removeTask(request: List.Remove.Request)
}

protocol ListRouterProtocol: AnyObject {
    func navigateToTask(view: UIViewController)
    func dismissSelf(listViewController: UIViewController)
}
