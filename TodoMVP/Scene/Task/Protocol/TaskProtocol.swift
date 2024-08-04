//
//  TaskProtocol.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit
import TodoRepositoryPackage

protocol TaskViewProtocol: AnyObject {
    
    /// Show the title on the screen.
    ///
    /// - Parameter viewModel: The data to be showed.
    ///
    func displayTitle(viewModel: TaskItem.Title.ViewModel)

    /// Show the add task form.
    ///
    /// - Parameter viewModel: The data to be used to show the form.
    func displyForm(viewModel: Form.Init.ViewModel)

    /// Show a success notification.
    ///
    /// - Parameter viewModel: The data to be used to show success.
    /// 
    func displayAddedSuccessfully(viewModel: TaskItem.Save.ViewModel)
}

protocol TaskPresenterProtocol: AnyObject {
    var view: TaskViewProtocol? { get set }
    var apiService: ApiServiceProtocol? { get set }

    /// Fetch the screen title
    ///
    func getTitle()

    /// Initialize the form
    ///
    func initForm()

    /// Add a new task.
    ///
    /// - Parameter request: The data to be saved.
    ///
    func addTask(request: TaskItem.Save.Request)
}

protocol TaskRouterProtocol: AnyObject {

    /// Close the current view.
    ///
    /// - Parameter taskViewController: the view to be dismissed.
    ///
    func dismissSelf(taskViewController: UIViewController)
}
