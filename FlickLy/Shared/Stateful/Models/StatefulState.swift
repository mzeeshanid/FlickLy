//
//  StatefulState.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation
import SwiftUI

final class StatefulState: StatefulLoadable, ObservableObject {
    
    @Published var loadingState: StatefulLoadingState = .none
    
    var isLoading: Bool {
        get {
            return self.loadingState == .initialLoading ||
            self.loadingState == .loadingMore ||
            self.loadingState == .refreshing
        }
    }
    
    var canLoadMore: Bool = false
    
    var loadingError: Error?
        
    var emptyDataTitle: String = ""
    var emptyDataCaption: String = ""
}

//MARK: Stateful States
extension StatefulState {
    func setUpEmptyState() {
        self.loadingState = .emptyData
    }
    
    func setUpRefreshingState() {
        self.loadingState = .refreshing
    }
    
    func setUpLoadingState(isEmpty: Bool) {
        self.loadingError = nil
        
        if isEmpty {
            self.loadingState = .initialLoading
        } else {
            self.loadingState = .loadingMore
        }
    }
    
    func setUpFailState(error: Error, isEmpty: Bool) {
        self.loadingError = error
        
        if !isEmpty {
            self.loadingState = .loadingMoreError
        } else {
            self.loadingState = .initialLoadError
        }
    }
    
    func setUpFinishedLoading() {
        self.loadingState = .none
    }
    
    func updateEmptyData(title: String, caption: String) {
        self.emptyDataTitle = title
        self.emptyDataCaption = caption
    }
    
    func updateCanLoadMore(canLoadMore: Bool) {
        self.canLoadMore = canLoadMore
    }
}
