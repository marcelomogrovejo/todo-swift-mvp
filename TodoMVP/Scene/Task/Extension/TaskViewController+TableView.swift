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
        TaskCellType.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
//        TaskSectionType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.tableCellId, for: indexPath) as! TaskTableViewCell
        guard let section = TaskCellType(rawValue: indexPath.section) else { return UITableViewCell() }
        // TODO: viewModel and setupCell()
        print(section)
        switch section {
        case .date:
            cell.pickerType = .date
        case .time:
            cell.pickerType = .time
        default:
            break
        }
        cell.placeholder = section.description
        cell.callback = { string in
            self.dataSource[indexPath.section] = string
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
