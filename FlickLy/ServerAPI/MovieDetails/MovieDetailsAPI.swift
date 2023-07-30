//
//  MovieDetailsAPI.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import Foundation
import Alamofire

class MovieDetailsAPI: BaseAPI {
    static func fetchMovieDetails(id: Int,
                                  completion:@escaping (Result<MovieDetails, Error>) -> Void) -> DataRequest {
        let endPoint = MovieDetailsEndPoint.getMovieDetails(id)
        return performRequestReturning(endpoint: endPoint,
                                       completion: completion)
    }
}
