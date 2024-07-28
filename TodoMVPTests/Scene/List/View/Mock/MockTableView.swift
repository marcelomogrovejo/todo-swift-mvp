//
//  MockTableView.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 28/07/2024.
//

import Foundation
import UIKit

class MockTableView: UITableView {

    private(set) var isReloadDataCalled = false
    private(set) var numberOfTimesIsCalledRealoadData = 0

    override func reloadData() {
        isReloadDataCalled = true
        numberOfTimesIsCalledRealoadData += 1
    }

}
