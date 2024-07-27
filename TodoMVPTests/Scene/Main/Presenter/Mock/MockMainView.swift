//
//  MockMainView.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 23/07/2024.
//

import Foundation
@testable import TodoMVP

class MockMainView: MainViewProtocol {

    private(set) var isDisplayButtonTitleCalled = false
    private(set) var numberOfTimesIsCalledGetDisplayButtonTitle = 0

    func displayButtonTitle(viewModel: Main.List.ViewModel) {
        isDisplayButtonTitleCalled = true
        numberOfTimesIsCalledGetDisplayButtonTitle += 1
    }

}
