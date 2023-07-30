//
//  MovieDetailsViewModelTests.swift
//  FlickLyTests
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import XCTest

@testable import FlickLy

final class MovieDetailsViewModelTests: XCTestCase {

    var viewModel: MovieDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        
        let movie = Movie.dummyMovie1()
        let repo = MovieDetailsTestRepo()
        
        self.viewModel = MovieDetailsViewModel(repository: repo,
                                               movie: movie)
    }
    
    func testFetchDetails() {
        self.viewModel.fetchMovieDetails()
        XCTAssertNotNil(self.viewModel.details)
        
        XCTAssertEqual(self.viewModel.movie.id, self.viewModel.details?.id)
        XCTAssertEqual(self.viewModel.movie.title, self.viewModel.details?.title)
    }
}
