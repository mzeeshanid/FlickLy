//
//  MovieDetailModelTest.swift
//  FlickLyTests
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import XCTest

@testable import FlickLy

final class MovieDetailModelTest: XCTestCase {

    func testMovieDetails() {
        let details = MovieDetails.dummyMovieDetails1()
        
        XCTAssertNotNil(details.id)
        XCTAssertTrue(!details.title.isEmpty)
        XCTAssertTrue(!details.year.isEmpty)
        XCTAssertTrue(!details.overview!.isEmpty)
        
    }
    
    func testGenres() {
        let genres = MovieGenre.dummyGenres()
        
        for genre in genres {
            XCTAssertNotNil(genre.id)
            XCTAssertTrue(!genre.name!.isEmpty)
        }
    }

}
