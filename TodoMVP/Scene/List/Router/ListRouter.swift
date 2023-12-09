//
//  ListRouter.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 26/11/2023.
//

import UIKit

class ListRouter: ListRouterProtocol {

    func navigateToTask(view: UIViewController) {
        let destinationVC = TaskFactory().createScene() as! TaskViewController
        destinationVC.title = "ToDo List"
        destinationVC.isModalInPresentation = true
        destinationVC.delegate = view as! ListViewController
        let navVC = UINavigationController(rootViewController: destinationVC)
        view.present(navVC, animated: true)
    }

    func dismissSelf(listViewController: UIViewController) {
        listViewController.dismiss(animated: true)
    }
}
