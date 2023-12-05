//
//  MainView+DisplayLogic.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import Foundation

extension MainViewController: MainViewProtocol {

    // MARK: - Display logic

    func displayWelcomeMessage(viewModel: Main.Welcome.ViewModel) {
//        welcomeLabel.text = viewModel.message
    }

    func displayButtonTitle(viewModel: Main.List.ViewModel) {
        listButton.setTitle(viewModel.title, for: .normal)
    }

}
