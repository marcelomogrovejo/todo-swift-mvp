//
//  MainProtocol.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    
    /// Shows the title on the button.
    ///
    /// - Parameter viewModel: The data to be used to show the title.
    /// 
    func displayButtonTitle(viewModel: Main.List.ViewModel)
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    
    /// Request the button title.
    ///
    func getListTitleButton()
}

protocol MainRouterProtocol: AnyObject {
    
    /// Navigates to the task list view.
    ///
    /// - Parameter view: The current/parent view.
    func navigateToTodoList(view: UIViewController)
}
