//
//  ListProtocol.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 23/09/2023.
//

import UIKit
import TodoRepositoryPackage

protocol ListViewProtocol: AnyObject {

    /// Shows a list of tasks on the screen.
    ///
    /// - Parameter viewModel: The data to be used to show the list.
    ///
    func displayListItems(viewModel: List.Tasks.ViewModel)
    
//    func displayPopup(viewModel: List.Error.ViewModel)

    /// Shows a removing task notification.
    ///
    /// It is an alert that asks to confirm the removal of the task.
    ///
    /// - Parameter viewModel: The data to be used to show the notification.
    ///
    func displayDeletionConfirmed(viewModel: List.Remove.ViewModel)
    
    /// Shows a removing task notification.
    ///
    /// It is an alert confirming the deletion.
    ///
    func displayTaskRemoved()
    
    /// Refresh the tasks list.
    ///
    /// It is refreshed due to a task removing not confirmed.
    ///
    func displayTaskRemovalCancellation()
    
    /// Shows an erron notification.
    ///
    func displayTaskRemoveError()
    
    /// Shows the screen title.
    ///
    /// - Parameter viewModel: The data to be used to show the title.
    func displayTitle(viewModel: List.Title.ViewModel)
    
    /// Shows a loading indicator.
    ///
    func displayLoadingIndicator()
    
    /// Hides a loading indicator.
    ///
    func hideLoadingIndicator()
}

protocol ListPresenterProtocol: AnyObject {
    var view: ListViewProtocol? { get set }
    var apiService: ApiServiceProtocol? { get set }
    
    /// Fetches the screen title.
    ///
    func getTitle()
    
    /// Fetches a list of tasks.
    ///
    func fetchTaskList()
    
//    func fetchAvatar(request: List.Avatar.Request, completion: @escaping (Data?) -> Void)
    
    /// Adds a new task.
    ///
    /// - Parameter request: The data task requested.
    func newTask(request: List.New.Request)
    
    /// Updates an existing task.
    ///
    /// - Parameter request: The data to be updated.
    func updateTask(request: List.Update.Request)
    
    /// Requests a task deletion confirmation.
    ///
    /// - Parameter request: The data task to be deleted.
    func getRemoveConfirmation(request: List.Remove.Request)
    
    /// Request a task deletion cancellation.
    ///
    func cancelTaskRemoval()
    
    /// Request a task deletion.
    /// - Parameter request: The task to be deleted.
    func removeTask(request: List.Remove.Request)
}

protocol ListRouterProtocol: AnyObject {
    
    /// Navigates to task screen.
    ///
    /// - Parameter view: The current/parent view.
    ///
    func navigateToTask(view: UIViewController)
    
    /// Close the current view.
    ///
    /// - Parameter listViewController: The view to be dismissed.
    ///
    func dismissSelf(listViewController: UIViewController)
}
