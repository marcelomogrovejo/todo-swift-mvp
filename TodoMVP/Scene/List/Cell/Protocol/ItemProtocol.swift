//
//  ItemProtocol.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import Foundation

protocol ItemViewProtocol: AnyObject {
    func displayVerifiedDate(viewModel: Item.Date.ViewModel)
}

protocol ItemPresenterProtocol: AnyObject {
    var view: ItemViewProtocol? { get set }
    func verifyDate(request: Item.Date.Request)
}
