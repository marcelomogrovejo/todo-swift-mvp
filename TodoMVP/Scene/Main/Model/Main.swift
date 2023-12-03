//
//  Main.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import Foundation

struct Main {
    enum Welcome {
        struct Request {}
        struct Response {}
        struct ViewModel {
            let message: String
        }
    }
    enum List {
        struct Request {}
        struct Response {}
        struct ViewModel {
            let title: String
        }
    }
}
