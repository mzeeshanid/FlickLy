//
//  AppEnvironment.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation

enum AppEnvironment: String {
    case prod = "prod", dev = "dev"
    
    var baseUrl: String {
        switch self {
        case .dev:
            return AppApiBaseUrl.dev
        default:
            return AppApiBaseUrl.prod
        }
    }
    
    var theMovieDBAppId: String {
        switch self {
        case .dev:
            return TheMovieDBAppId.dev
        case .prod:
            return TheMovieDBAppId.prod
        }
    }
    
    var theMovieDBPosterBaseUrl: String {
        switch self {
        case .dev:
            return AppPosterBaseUrl.dev
        case .prod:
            return AppPosterBaseUrl.prod
        }
    }
}

