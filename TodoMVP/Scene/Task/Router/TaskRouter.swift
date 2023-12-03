//
//  TaskRouter.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit

class TaskRouter: TaskRouterProtocol {

    func dismissSelf(taskViewController: UIViewController) {
        taskViewController.dismiss(animated: true)
    }

}
