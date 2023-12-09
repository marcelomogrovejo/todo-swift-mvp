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
        dataSource = viewModel.dataSource
        tableView.reloadData()
    }
}
