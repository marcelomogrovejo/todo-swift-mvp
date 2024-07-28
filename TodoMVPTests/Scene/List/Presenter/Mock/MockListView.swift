//
//  MockListView.swift
//  TodoMVPTests
//
//  Created by Marcelo Mogrovejo on 27/07/2024.
//

import Foundation
@testable import TodoMVP

class MockListView: ListViewProtocol {

    private(set) var isDisplayListItemsCalled = false
    private(set) var numberOfTimesIsCalledDisplayListItems = 0
    private(set) var isDisplayDeletionConfirmedCalled = false
    private(set) var numberOfTimesIsCalledDisplayDeletionConfirmed = 0
    private(set) var isDisplayTaskRemovedCalled = false
    private(set) var numberOfTimesIsCalledDisplayTaskRemoved = 0
    private(set) var isDisplayTaskRemovalCancellationCalled = false
    private(set) var numberOfTimesIsCalledDisplayTaskRemovalCancellation = 0
    private(set) var isDisplayTaskRemoveErrorCalled = false
    private(set) var numberOfTimesIsCalledDisplayTaskRemoveError = 0
    private(set) var isDisplayTitleCalled = false
    private(set) var numberOfTimesIsCalledDisplayTitle = 0
    private(set) var isDisplayLoadingIndicatorCalled = false
    private(set) var numberOfTimesIsCalledDisplayLoadingIndicator = 0
    private(set) var isHideLoadingIndicatorCalled = false
    private(set) var numberOfTimesIsCalledHideLoadingIndicator = 0

    func displayListItems(viewModel: TodoMVP.List.Tasks.ViewModel) {
        isDisplayListItemsCalled = true
        numberOfTimesIsCalledDisplayListItems += 1
    }
    
    func displayDeletionConfirmed(viewModel: TodoMVP.List.Remove.ViewModel) {
        isDisplayDeletionConfirmedCalled = true
        numberOfTimesIsCalledDisplayDeletionConfirmed += 1
    }
    
    func displayTaskRemoved() {
        isDisplayTaskRemovedCalled = true
        numberOfTimesIsCalledDisplayTaskRemoved += 1
    }
    
    func displayTaskRemovalCancellation() {
        isDisplayTaskRemovalCancellationCalled = true
        numberOfTimesIsCalledDisplayTaskRemovalCancellation += 1
    }
    
    func displayTaskRemoveError() {
        isDisplayTaskRemoveErrorCalled = true
        numberOfTimesIsCalledDisplayTaskRemoveError += 1
    }
    
    func displayTitle(viewModel: TodoMVP.List.Title.ViewModel) {
        isDisplayTitleCalled = true
        numberOfTimesIsCalledDisplayTitle += 1
    }
    
    func displayLoadingIndicator() {
        isDisplayLoadingIndicatorCalled = true
        numberOfTimesIsCalledDisplayLoadingIndicator += 1
    }
    
    func hideLoadingIndicator() {
        isHideLoadingIndicatorCalled = true
        numberOfTimesIsCalledHideLoadingIndicator += 1
    }

}
