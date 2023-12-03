//
//  Item.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import Foundation

struct Item {
    enum Date {
        struct Request {
            let dateStr: String
        }
        struct Response {}
        struct ViewModel {
            let dateStr: String
            let isExpired: Bool
        }
    }
}
