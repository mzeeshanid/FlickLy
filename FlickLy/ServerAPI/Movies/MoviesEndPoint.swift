//
//  MoviesEndPoint.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation
import Alamofire

enum MoviesEndPoint: APIConfiguration {
    
    case getMovies(_ page: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "discover/movie"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getMovies(let page):
            return ["page" : page,
                    "api_key" : AppConfiguration.environment.theMovieDBAppId]
        }
    }
    
    var headers: HTTPHeaders? {
        var headerDict: HTTPHeaders = [:]
        
        headerDict["Content-Type"] =  AppParameterEncoding.contentEncoding
        headerDict["Accept"] =  AppParameterEncoding.contentEncoding
        
        return headerDict
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var url = URL(string: AppConfiguration.environment.baseUrl)!
        url = url.appendingPathComponent(path)
        
        let request = AF.request(url,
                                 method: method,
                                 parameters: parameters,
                                 headers: headers)
        
        return try! request.convertible.asURLRequest()
    }
}
