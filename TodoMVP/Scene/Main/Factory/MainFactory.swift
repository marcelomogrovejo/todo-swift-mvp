//
//  MainFactory.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import UIKit

class MainFactory {

    public init() {}

    public func createScene() -> UIViewController {
        let view = MainViewController()
        let presenter: MainPresenterProtocol? = MainPresenter()
        let router: MainRouterProtocol? = MainRouter()

        view.presenter = presenter
        view.router = router

        presenter?.view = view

        

        return view
    }
}
