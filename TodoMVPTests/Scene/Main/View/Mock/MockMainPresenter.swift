//
//  MockMainPresenter.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import Foundation
@testable import TodoMVP

class MockMainPresenter: MainPresenterProtocol {

    // Just to conform the protocol
    var view: MainViewProtocol?

    private(set) var isGetListTitleButtonCalled = false
    private(set) var numberOfTimesIsCalledGetListTitleButton = 0

    func getListTitleButton() {
        isGetListTitleButtonCalled = true
        numberOfTimesIsCalledGetListTitleButton += 1
    }

}
