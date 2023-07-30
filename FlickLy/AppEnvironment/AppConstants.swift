//
//  AppConstants.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation

struct AppApiBaseUrl {
    static let prod = "https://api.themoviedb.org/3/"
    static let dev = "https://api.themoviedb.org/3/"
}

struct TheMovieDBAppId {
    static let prod = ""
    static let dev = ""
}

struct AppParameterEncoding {
    static let acceptableEncoding = "application/json"
    static let contentEncoding = "application/json"
}

struct AppPosterBaseUrl {
    static let prod = "https://image.tmdb.org/t/p/"
    static let dev = "https://image.tmdb.org/t/p/"
}
