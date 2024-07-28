//
//  MockListRouter.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 27/07/2024.
//

import Foundation
import UIKit
@testable import TodoMVP

class MockListRouter: ListRouterProtocol {

    private(set) var isNavigateToTaskCalled = false
    private(set) var numberOfTimesIsCalledNavigateToTask = 0
    private(set) var isDismissSelfCalled = false
    private(set) var numberOfTimesIsCalledDismissSelf = 0

    func navigateToTask(view: UIViewController) {
        isNavigateToTaskCalled = true
        numberOfTimesIsCalledNavigateToTask += 1
    }
    
    func dismissSelf(listViewController: UIViewController) {
        isDismissSelfCalled = true
        numberOfTimesIsCalledDismissSelf += 1
    }

}
