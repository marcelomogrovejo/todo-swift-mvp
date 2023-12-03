//
//  List.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 23/09/2023.
//

import Foundation

struct List {
    enum Title {
        struct Request {}
        struct Response {}
        struct ViewModel {
            let title: String
        }
    }
    enum Tasks {
        struct Request {}
        struct Response {}
        struct ViewModel {
            let tasks: [Task]
        }
    }
    enum New {
        struct Request {
            let task: Task
        }
        struct Response {}
        struct ViewModel {}
    }
    enum Update {
        struct Request {
            let task: Task
        }
        struct Response {}
        struct ViewModel {}
    }
    enum Remove {
        struct Request {
            let task: Task
        }
        struct Response {}
        struct ViewModel {}
    }
}

struct Task {
    let avatar: String?
    let username: String
    let title: String
    let date: String
    let description: String
    let isComplete: Bool
}
