//
//  TaskFactory.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit
import TodoRepositoryPackage

class TaskFactory {

    /// Create a new scene.
    ///
    /// Setups all the components of the scene.
    /// 
    /// - Returns: The main view of the scene.
    /// 
    func createScene() -> UIViewController {
        let view = TaskViewController()
        let presenter: TaskPresenterProtocol? = TaskPresenter()
        let router: TaskRouterProtocol? = TaskRouter()
        let apiService: ApiServiceProtocol = ApiService()

        view.presenter = presenter
        view.router = router

        presenter?.view = view
        presenter?.apiService = apiService

        /// Registeer scene fonts
//        BubblegumSansFontManager.registerFonts()

        return view
    }
}
