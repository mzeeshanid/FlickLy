//
//  MoviesAPI.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation
import Alamofire

class MoviesAPI: BaseAPI {
    static func fetchMovies(page: Int,
                            completion:@escaping (Result<MoviesResponse, Error>) -> Void) -> DataRequest {
        let endPoint = MoviesEndPoint.getMovies(page)
        return performRequestReturning(endpoint: endPoint,
                                       completion: completion)
    }
}
