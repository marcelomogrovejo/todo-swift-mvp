//
//  TaskDataSource.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import UIKit

class TaskDataSource: NSObject, UITableViewDataSource {

    struct Constants {
        static let numberOfSections: Int = 1
        static let tableCellId: String = "TableCellId"
    }

    var data: [String] = []
    
    // MARK: - UITableView data source
 
    func numberOfSections(in tableView: UITableView) -> Int {
        TaskCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableCellId, for: indexPath) as! TaskTableViewCell
        guard let section = TaskCellType(rawValue: indexPath.section) else { return UITableViewCell() }
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
            self.data[indexPath.section] = string
        }
        return cell
    }
}
