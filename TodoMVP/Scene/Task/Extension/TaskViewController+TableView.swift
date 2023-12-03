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
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.titleCellId, 
                                                     for: indexPath) as! TaskTextFieldTableViewCell
            cell.placeholder = "Title"
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.descriptionCellId, 
                                                     for: indexPath) as! TaskTextFieldTableViewCell
            cell.placeholder = "Description"
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.dateCellId, 
                                                     for: indexPath) as! TaskDateTimeTableViewCell
            cell.placeholder = "Date"
            cell.pickerType = .date
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.timeCellId, 
                                                     for: indexPath) as! TaskDateTimeTableViewCell
            cell.placeholder = "Time"
            cell.pickerType = .time
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 100.0
        }
        return 40.0
    }
}
