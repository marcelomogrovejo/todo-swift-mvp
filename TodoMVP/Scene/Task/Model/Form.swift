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
}
