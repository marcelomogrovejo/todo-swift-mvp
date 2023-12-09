//
//  ItemPresenter.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import Foundation

class ItemPresenter: ItemPresenterProtocol {

    weak var view: ItemViewProtocol?

    func verifyDate(request: Item.Date.Request) {
        var isExpired = false
        if request.dateStr.fullFormattedDate < Date() {
            isExpired = true
        }
        let viewModel = Item.Date.ViewModel(dateStr: request.dateStr, isExpired: isExpired)
        view?.displayVerifiedDate(viewModel: viewModel)
    }

}
