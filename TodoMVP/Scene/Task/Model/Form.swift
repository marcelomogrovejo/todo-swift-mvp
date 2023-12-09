//
//  Form.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 09/12/2023.
//

import Foundation

struct Form {
    enum Init {
        struct Request {}
        struct Response {}
        struct ViewModel {
            let dataSource: [String]
        }
    }
    struct TodoItem {
        let title: String
        let description: String
        let date: Date
        let time: Date
        let dateTime: Date
    }
}
