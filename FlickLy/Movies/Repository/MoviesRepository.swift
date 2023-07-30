//
//  MoviesRepository.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation
import Alamofire

/*
 A repository that is responsible for fetching Movies from the data source.
 */

typealias MoviesAPIResult = Result<[Movie], Error>

protocol MoviesRepositoryProtocol: AnyObject {
    func fetchMovies(page: Int, completion: @escaping (MoviesAPIResult) -> Void)
}

class MoviesRepository {
    
    private func fetchMoviesFromAPI(page: Int, completion: @escaping (MoviesAPIResult) -> Void) {
        let _ = MoviesAPI.fetchMovies(page: page,
                                      completion: { result in
            switch result {
            case .success(let response):
                completion(.success(response.results ?? []))
            case .failure(let error):
                guard error._code != AFError.explicitlyCancelled._code else {
                    return
                }
                
                completion(.failure(error))
            }
        })
    }
}

//MARK: MoviesRepositoryProtocol
extension MoviesRepository: MoviesRepositoryProtocol {
    func fetchMovies(page: Int, completion: @escaping (MoviesAPIResult) -> Void) {
        self.fetchMoviesFromAPI(page: page, completion: completion)
    }
}
