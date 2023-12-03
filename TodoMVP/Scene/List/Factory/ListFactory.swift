//
//  ListFactory.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 23/09/2023.
//

import UIKit
import TodoRepositoryPackage

class ListFactory {

    public init() { }

    public func createScene() -> UIViewController {
        let view = ListViewController()
        let presenter: ListPresenterProtocol? = ListPresenter()
        let router: ListRouterProtocol? = ListRouter()
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

