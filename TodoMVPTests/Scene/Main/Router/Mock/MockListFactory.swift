//
//  MockListFactory.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 23/07/2024.
//

import UIKit
@testable import TodoMVP

class MockListFactory: ListFactoryProtocol {

    private(set) var isCreateSceneCalled = false
    private(set) var numberOfTimesIsCalledCreateScene = 0

    func createScene() -> UIViewController {
        isCreateSceneCalled = true
        numberOfTimesIsCalledCreateScene += 1
        return UIViewController()
    }

}
