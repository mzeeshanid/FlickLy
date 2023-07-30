//
//  MoviesResponse.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation
import SwiftUI

struct MoviesResponse: Codable {
    
    let results: [Movie]?
    
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Codable, Identifiable {
    
    let id: Int
    let title: String
    
    let genreIds: [Int]?
    
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    
    let voteAverage: Double
    let voteCount: Int
    
    var year: String {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-mm-dd"
            dateformatter.timeZone = TimeZone(identifier: "UTC")
            
            let date = dateformatter.date(from: releaseDate ?? "")
            dateformatter.dateFormat = "yyyy"
            return dateformatter.string(from: date ?? Date())
        }
    }

    var posterUrl: URL? {
        get {
            var url = URL(string: AppConfiguration.environment.theMovieDBPosterBaseUrl)
            url = url?.appendingPathComponent("w300")
            url = url?.appendingPathComponent(self.posterPath ?? "")
            return url
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension Movie {
    static func dummyMovie1() -> Movie {
        return Movie(id: 700391,
                     title: "65",
                     genreIds: [1, 3, 4],
                     originalLanguage: "en",
                     originalTitle: "65",
                     overview: "65 million years ago, the only 2 survivors of a spaceship from Somaris that crash-landed on Earth, must fend off dinosaurs to reach the escape vessel in time before an imminent asteroid strike threatens to destroy the planet.",
                     popularity: 187.856,
                     posterPath: "/rzRb63TldOKdKydCvWJM8B6EkPM.jpg",
                     releaseDate: "2023-03-02",
                     voteAverage: 6.17,
                     voteCount: 1443)
    }
}
