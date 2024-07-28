//
//  MainProtocol.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func displayButtonTitle(viewModel: Main.List.ViewModel)
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }

    func getListTitleButton()
}

protocol MainRouterProtocol: AnyObject {
    func navigateToTodoList(view: UIViewController)
}
