//
//  StatefulLoadingTests.swift
//  FlickLyTests
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import XCTest

@testable import FlickLy

final class StatefulLoadingTests: XCTestCase {

    func testInitialLoading() {
        let stateful = StatefulState()
        stateful.setUpLoadingState(isEmpty: true)
        
        XCTAssertEqual(stateful.loadingState, .initialLoading)
    }
    
    func testEmptyData() {
        let stateful = StatefulState()
        stateful.setUpEmptyState()
        
        XCTAssertEqual(stateful.loadingState, .emptyData)
    }
    
    func testInitialLoadingError() {
        let stateful = StatefulState()
        
        let error = NSError(domain: "",
                            code: 123,
                            userInfo: [NSLocalizedDescriptionKey : "Network error"])
        stateful.setUpFailState(error: error as Error,
                                isEmpty: true)
        
        XCTAssertEqual(stateful.loadingState, .initialLoadError)
        XCTAssertNotNil(stateful.loadingError)
    }

    func testLoadingMore() {
        let stateful = StatefulState()
        stateful.canLoadMore = true
        stateful.setUpLoadingState(isEmpty: false)
        
        XCTAssertTrue(stateful.canLoadMore)
        XCTAssertEqual(stateful.loadingState, .loadingMore)
    }
    
    func testLoadingMoreError() {
        let stateful = StatefulState()
        stateful.canLoadMore = true
        
        let error = NSError(domain: "",
                            code: 123,
                            userInfo: [NSLocalizedDescriptionKey : "Network error"])
        stateful.setUpFailState(error: error as Error,
                                isEmpty: false)
        
        XCTAssertTrue(stateful.canLoadMore)
        XCTAssertEqual(stateful.loadingState, .loadingMoreError)
        XCTAssertNotNil(stateful.loadingError)
    }
    
    func testRefreshing() {
        let stateful = StatefulState()
        stateful.setUpRefreshingState()
        
        XCTAssertEqual(stateful.loadingState, .refreshing)
    }
    
    func testNone() {
        let stateful = StatefulState()
        stateful.setUpFinishedLoading()
        
        XCTAssertEqual(stateful.loadingState, .none)
    }
}
