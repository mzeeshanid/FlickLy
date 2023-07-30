//
//  MovieDetailRepository.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

/*
 A repository that is responsible for fetching Movie details from the data source.
 */

import Foundation
import Alamofire

typealias MovieDetailsAPIResult = Result<MovieDetails, Error>

protocol MovieDetailRepositoryProtocol: AnyObject {
    func fetchMovieDetails(id: Int, completion: @escaping (MovieDetailsAPIResult) -> Void)
}

class MovieDetailRepository {
    private func fetchMovieDetailsFromAPI(id: Int, completion: @escaping (MovieDetailsAPIResult) -> Void) {
        let _ = MovieDetailsAPI.fetchMovieDetails(id: id) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                guard error._code != AFError.explicitlyCancelled._code else {
                    return
                }
                
                completion(.failure(error))
            }
        }
    }
}

//MARK: MovieDetailRepositoryProtocol
extension MovieDetailRepository: MovieDetailRepositoryProtocol {
    func fetchMovieDetails(id: Int, completion: @escaping (MovieDetailsAPIResult) -> Void) {
        self.fetchMovieDetailsFromAPI(id: id, completion: completion)
    }
}
