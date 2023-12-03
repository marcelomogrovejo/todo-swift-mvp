//
//  TaskProtocol.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit
import TodoRepositoryPackage

protocol TaskViewProtocol: AnyObject {
    func displayTitle(viewModel: TaskItem.Title.ViewModel)
    func displyForm()
}

protocol TaskPresenterProtocol: AnyObject {
    var view: TaskViewProtocol? { get set }
    var apiService: ApiServiceProtocol? { get set }

    func getTitle()
    func fetchForm()
}

protocol TaskRouterProtocol: AnyObject {
    func dismissSelf(taskViewController: UIViewController)
}
