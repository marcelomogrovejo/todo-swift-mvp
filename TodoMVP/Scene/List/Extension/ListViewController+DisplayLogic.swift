//
//  ListViewController+DisplayLogic.swift
//  ListPostsMVP
//
//  Created by Marcelo Mogrovejo on 10/02/2023.
//

import Foundation

extension ListViewController: ListViewProtocol {

    // MARK: - Display logic

    func displayTitle(viewModel: List.Title.ViewModel) {
        title = viewModel.title
    }

    func displayListItems(viewModel: List.Tasks.ViewModel) {
        tasks = viewModel.tasks
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func displayDeletionConfirmed(viewModel: List.Remove.ViewModel) {
        presentAlertWithTitle("Confirm",
                              message: "Are you sure you want to remove this task?",
                              options: "OK", "Cancel") { [weak self] option in
            #if DEBUG
            print(option)
            #endif
            guard let self = self else { return }
            switch option {
            case 0:
                // OK
                let request = List.Remove.Request(task: viewModel.task)
                self.presenter?.removeTask(request: request)
            case 1:
                // Cancel
                self.presenter?.cancelTaskRemoval()
            default:
                break
            }
        }

    }

    func displayTaskRemovalCancellation() {
        tableView.reloadData()
    }

    func displayTaskRemoved() {
        presentAlertWithTitle("Successfully", message: "Your task has been removed successfully.", options: "OK") { [weak self] option in
            guard let self = self else { return }
            print("Task successfully removed.")
            self.presenter?.fetchTaskList()
        }
    }

    func displayTaskRemoveError() {
        presentAlertWithTitle("Error", message: "There has been an error removing your task.", options: "OK") { [weak self] option in
            guard let self = self else { return }
            print("Error removing task.")
            self.tableView.reloadData()
        }
    }

    func displayLoadingIndicator() {
//        progressView.show()
    }
    func hideLoadingIndicator() {
//        progressView.hide()
    }
}

