//
//  MovieModelTests.swift
//  FlickLyTests
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import XCTest

@testable import FlickLy

final class MovieModelTests: XCTestCase {

    func testCurrencyModels() {
        let movie = Movie.dummyMovie1()
        
        XCTAssertNotNil(movie.id)
        XCTAssertTrue(!movie.title.isEmpty)
        XCTAssertTrue(!movie.year.isEmpty)
    }

}
