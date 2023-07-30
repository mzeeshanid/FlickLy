//
//  MovieRepoTest.swift
//  FlickLyTests
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import XCTest

@testable import FlickLy

final class MovieViewModelTests: XCTestCase {

    var viewModel: MoviesViewModel!
    
    override func setUp() {
        super.setUp()
        
        let repository = MovieTestRepo()
        self.viewModel = MoviesViewModel(repository: repository)
    }
    
    func testFetchMovies() {
        self.viewModel.fetchMovies()
        
        XCTAssertTrue(!self.viewModel.movies.isEmpty)
    }

}
