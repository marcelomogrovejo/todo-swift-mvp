//
//  MainView+DisplayLogic.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import Foundation

extension MainViewController: MainViewProtocol {

    // MARK: - Display logic

    func displayButtonTitle(viewModel: Main.List.ViewModel) {
        listButton.setTitle(viewModel.title, for: .normal)
    }

}
