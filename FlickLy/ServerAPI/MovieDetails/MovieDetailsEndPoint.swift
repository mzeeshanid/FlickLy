//
//  MovieDetailsEndPoints.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import Foundation
import Alamofire

enum MovieDetailsEndPoint: APIConfiguration {
    
    case getMovieDetails(_ id: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getMovieDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovieDetails(let id):
            return "movie/\(id)"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getMovieDetails:
            return ["api_key" : AppConfiguration.environment.theMovieDBAppId]
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
