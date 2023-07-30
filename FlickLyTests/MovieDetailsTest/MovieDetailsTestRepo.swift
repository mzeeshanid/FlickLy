//
//  MovieDetailTestRepo.swift
//  FlickLyTests
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import Foundation

@testable import FlickLy

class MovieDetailsTestRepo {
    
}

//MARK: MovieDetailRepositoryProtocol
extension MovieDetailsTestRepo: MovieDetailRepositoryProtocol {
    func fetchMovieDetails(id: Int, completion: @escaping (MovieDetailsAPIResult) -> Void) {
        completion(.success(MovieDetails.dummyMovieDetails1()))
    }
}
