//
//  ListDataSource.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import UIKit

class ListDataSource: NSObject, UITableViewDataSource {

    struct Constants {
        static let numberOfSections: Int = 1
        static let cellId: String = "ItemCellId"
    }

    var tasks: [Task] = []

    // MARK: - UITableView data source

    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count == 0 ? tableView.setEmptyMessage("You don't have any task defined yet.") : tableView.restore()
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as! ItemTableViewCell

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

}
