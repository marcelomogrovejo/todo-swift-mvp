//
//  TaskViewController+TableView.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import UIKit

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - TableView delegate & datasource

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == TableViewFieldType.title.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.titleCellId,
                                                     for: indexPath) as! TaskTableViewCell
            cell.placeholder = "Title"
            return cell
        } else if indexPath.row == TableViewFieldType.description.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.descriptionCellId,
                                                     for: indexPath) as! TaskTableViewCell
            cell.placeholder = "Description"
            return cell
        } else if indexPath.row == TableViewFieldType.date.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.dateCellId,
                                                     for: indexPath) as! TaskTableViewCell
            cell.placeholder = "Date"
            cell.pickerType = .date
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.timeCellId, 
                                                     for: indexPath) as! TaskTableViewCell
            cell.placeholder = "Time"
            cell.pickerType = .time
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
