//
//  MockRouterTaskView.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import UIKit

class MockRouterTaskView: UIViewController {

    private(set) var isDismissCalled = false
    private(set) var numberOfTimesIsCalledDismiss = 0

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isDismissCalled = true
        numberOfTimesIsCalledDismiss += 1
    }
}
