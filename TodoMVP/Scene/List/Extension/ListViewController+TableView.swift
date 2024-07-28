//
//  ListViewController+TableView.swift
//  ListPostsMVP
//
//  Created by Marcelo Mogrovejo on 10/02/2023.
//

import UIKit

extension ListViewController: UITableViewDelegate {

    // MARK: - TableView delegate

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [weak self] (action, view, completion) in
            guard let self = self else { return }
            guard let dataSource = dataSource else { return }
            let request = List.Remove.Request(task: dataSource.tasks[indexPath.row])
            print("Delete: \(request)")
            self.presenter?.getRemoveConfirmation(request: request)
        }
//        deleteAction.image = UIImage(named: "icn-delete-task.png")
        deleteAction.backgroundColor = .red

        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completion) in

            print("Editing task...")
            completion(true)
        }
//        editAction.image = UIImage(named: "icn-edit-task.png")
//        editAction.backgroundColor = .blue

        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
