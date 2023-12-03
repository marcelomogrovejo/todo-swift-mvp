//
//  MainProtocol.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func displayWelcomeMessage(viewModel: Main.Welcome.ViewModel)
    func displayButtonTitle(viewModel: Main.List.ViewModel)
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }

    func getWelcomeMessage()
    func getListTitleButton()
}

protocol MainRouterProtocol: AnyObject {
    func navigateToTodoList(view: UIViewController)
}
