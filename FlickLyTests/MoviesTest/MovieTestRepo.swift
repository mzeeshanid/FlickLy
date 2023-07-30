//
//  MovieTestRepo.swift
//  FlickLyTests
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import Foundation

@testable import FlickLy

class MovieTestRepo {
    
}

//MARK: MoviesRepositoryProtocol
extension MovieTestRepo: MoviesRepositoryProtocol {
    func fetchMovies(page: Int, completion: @escaping (MoviesAPIResult) -> Void) {
        completion(.success([Movie.dummyMovie1()]))
    }
}
