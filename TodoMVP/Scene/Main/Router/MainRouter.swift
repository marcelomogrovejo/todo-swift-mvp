//
//  MainRouter.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 23/09/2023.
//

import UIKit

class MainRouter: MainRouterProtocol {

    func navigateToTodoList(view: UIViewController) {
        let destinationVC = ListFactory().createScene()
        destinationVC.isModalInPresentation = true
        let navVC = UINavigationController(rootViewController: destinationVC)
        view.present(navVC, animated: true)
    }

    // MARK: - Private
}
