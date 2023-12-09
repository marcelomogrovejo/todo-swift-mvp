//
//  ItemTableViewCell+DisplayLogic.swift
//  TodoMVP
//
//  Created by Marcelo Mogrovejo on 03/12/2023.
//

import Foundation

extension ItemTableViewCell: ItemViewProtocol {

    func displayVerifiedDate(viewModel: Item.Date.ViewModel) {
        taskDateLabel.textColor = viewModel.isExpired ? .red : .Text.defaultColor
        taskDateLabel.text = viewModel.dateStr
    }

}
