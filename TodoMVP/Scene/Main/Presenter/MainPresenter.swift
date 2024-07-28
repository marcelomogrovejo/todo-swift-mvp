//
//  MainPresenter.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import Foundation

class MainPresenter: MainPresenterProtocol {

    // MARK: - Properties

    var view: MainViewProtocol?

    // MARK: - Business logic

    func getListTitleButton() {
        let viewModel = Main.List.ViewModel(title: "Todo List")
        view?.displayButtonTitle(viewModel: viewModel)
    }

}
