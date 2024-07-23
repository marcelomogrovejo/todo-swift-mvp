//
//  MockMainPresenter.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 22/09/2023.
//

import Foundation
@testable import TodoMVP

class MockMainPresenter: MainPresenterProtocol {

    var view: TodoMVP.MainViewProtocol?

    private(set) var isGetWellcomeMessageCalled = false
    private(set) var numberOfTimesIsCalledGetWellcomeMessage = 0

    func getWelcomeMessage() {
        isGetWellcomeMessageCalled = true
        numberOfTimesIsCalledGetWellcomeMessage += 1
    }

    func getListTitleButton() {
        // TODO
    }

}
