//
//  BaseAPI.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation
import Alamofire

protocol APIRequestable {
    associatedtype endpointType
    
    /**
    Using returning completion handler to make sure all paths are covered,
    return true, if it was a success, false otherwise
    */
    
    static func performRequestReturning<T: Decodable>(endpoint: endpointType,
                                                      decoder: JSONDecoder,
                                                      completion:@escaping (Result<T, Error>) -> Void) -> DataRequest
}

class BaseAPI {
    
}

extension BaseAPI: APIRequestable {
    
    typealias endpointType = APIConfiguration
    
    static func performRequestReturning<T>(endpoint: endpointType,
                                           decoder: JSONDecoder = JSONDecoder(),
                                           completion: @escaping (Result<T, Error>) -> Void) -> DataRequest where T : Decodable {
        return AF.request(endpoint)
          .responseDecodable (decoder: decoder) { (response: AFDataResponse<T>) in
              switch response.result {
              case .success(let res):
                  completion(.success(res))
              case .failure(let error):
                  completion(.failure(error))
              }
        }
    }
}
