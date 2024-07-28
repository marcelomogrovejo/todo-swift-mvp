//
//  TaskViewController+DisplayLogic.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import Foundation

extension TaskViewController: TaskViewProtocol {

    // MARK: - Display logic

    func displayTitle(viewModel: TaskItem.Title.ViewModel) {
        title = viewModel.title
    }

    func displyForm(viewModel: Form.Init.ViewModel) {
        dataSource.data = viewModel.dataSource
        tableView.reloadData()
    }

    func displayAddedSuccessfully(viewModel: TaskItem.Save.ViewModel) {
        presentAlertWithTitle("Task added", 
                              message: "Your task has been saved successfully",
                              options: "Close") { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.updateView()
            self.router?.dismissSelf(taskViewController: self)
        }
    }
}
