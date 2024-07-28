//
//  MockTaskRouter.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import UIKit
@testable import TodoMVP

class MockTaskRouter: TaskRouterProtocol {

    private(set) var isDismissSelfCalled = false
    private(set) var numberOfTimesIsCalledDismissSelf = 0

    func dismissSelf(taskViewController: UIViewController) {
        isDismissSelfCalled = true
        numberOfTimesIsCalledDismissSelf += 1
    }

}

