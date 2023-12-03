//
//  ListViewController+DisplayLogic.swift
//  ListPostsMVP
//
//  Created by Marcelo Mogrovejo on 10/02/2023.
//

import Foundation

extension ListViewController: ListViewProtocol {

    // MARK: - Display logic

    func displayTitle(viewModel: List.Title.ViewModel) {
        title = viewModel.title
    }

    func displayListItems(viewModel: List.Tasks.ViewModel) {
        tasks = viewModel.tasks
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

//    func displayPopup(viewModel: List.Error.ViewModel) {
//        let popupViewModel = ListPostsPopupModels.ViewModel(
//            icon: nil,
//            iconAccessibility: nil,
//            title: "Error",
//            titleAccessibility: "list-popup-title-id",
//            message: viewModel.errorMessage,
//            messageAccessibility: "list-popup-message-id",
//            buttonTitle: "Try again",
//            buttonAccssibility: "list-popup-button-id")
//
//        popupView.viewModel = popupViewModel
//        popupView.show()
//    }

    func displayLoadingIndicator() {
//        progressView.show()
    }
    func hideLoadingIndicator() {
//        progressView.hide()
    }
}

