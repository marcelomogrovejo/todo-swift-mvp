//
//  ListRouterTests.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 27/07/2024.
//

import XCTest
@testable import TodoMVP

final class ListRouterTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testListRouter_NavigateToTask_Successfully() {
        
    }

    func testListRouter_DismissSelf_Successfully() {
        let sut = ListRouter()
        sut.dismissSelf(listViewController: <#T##UIViewController#>)
    }
}
