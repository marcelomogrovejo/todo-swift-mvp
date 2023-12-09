//
//  TaskCellType.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 09/12/2023.
//

import Foundation

enum TaskCellType: Int, CaseIterable, CustomStringConvertible {
    case title
    case description
    case date
    case time

    var description: String {
        switch self {
        case .title: return "Title"
        case .description: return "Short description"
        case .date: return "Date"
        case .time: return "Time"
        }
    }
}
