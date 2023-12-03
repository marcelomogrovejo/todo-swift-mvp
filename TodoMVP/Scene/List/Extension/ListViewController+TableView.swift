//
//  ListViewController+TableView.swift
//  ListPostsMVP
//
//  Created by Marcelo Mogrovejo on 10/02/2023.
//

import UIKit

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - TableView delegate & datasource

    func numberOfSections(in tableView: UITableView) -> Int {
        TableViewConstants.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count == 0 ? tableView.setEmptyMessage("You don't have any task defined yet.") : tableView.restore()
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.cellId, for: indexPath) as! ItemTableViewCell

        cell.presenter = ItemPresenter()

        let task = tasks[indexPath.row]

        if let avatar = task.avatar {
//            let request = List.Avatar.Request(url: avatar)
//            presenter?.fetchAvatar(request: request) { data in
//                DispatchQueue.main.async {
//                    if let data = data {
//                        cell.avatarImage = UIImage(data: data)
//                    } else {
//                        cell.avatarImage = UIImage(named: "img-avatar-example")
//                    }
//                }
//            }
        }
        cell.title = task.title
        cell.date = task.date
        cell.desc = task.description
        cell.isDone = task.isComplete
        cell.id = indexPath.row
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in
            
            print("Deleting task...")
            completion(true)
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
