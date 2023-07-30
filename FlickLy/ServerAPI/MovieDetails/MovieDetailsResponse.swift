//
//  MovieDetailsResponse.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import Foundation

struct MovieDetails: Codable {
    
    let id: Int
    
    let status: String
    let tagline: String
    let title: String
    
    let collection: MovieCollection?
    
    let genres: [MovieGenre]?
    
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    
    let popularity: Double?
    let posterPath: String?
    
    let releaseDate: String?
    
    let voteAverage: Double?
    let voteCount: Int?

    var posterUrl: URL? {
        get {
            var url = URL(string: AppConfiguration.environment.theMovieDBPosterBaseUrl)
            url = url?.appendingPathComponent("w500")
            url = url?.appendingPathComponent(self.posterPath ?? "")
            return url
        }
    }
    
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
    
    enum CodingKeys: String, CodingKey {
        case collection = "belongs_to_collection"
        case genres, id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case status, tagline, title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieDetails {
    static func dummyMovieDetails1() -> MovieDetails {
        return MovieDetails(id: 700391,
                            status: "Released",
                            tagline: "65 million years ago, prehistoric Earth had a visitor.",
                            title: "65",
                            collection: nil,
                            genres: MovieGenre.dummyGenres(),
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

// MARK: - BelongsToCollection
struct MovieCollection: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
    }
}

// MARK: - Genre
struct MovieGenre: Codable {
    let id: Int?
    let name: String?
    
    static func dummyGenres() -> [MovieGenre] {
        return [
            MovieGenre(id: 1, name: "Action"),
            MovieGenre(id: 2, name: "Fantacy"),
            MovieGenre(id: 3, name: "War"),
            MovieGenre(id: 4, name: "Romance"),
            MovieGenre(id: 5, name: "Fiction"),
            MovieGenre(id: 6, name: "Comedy")
        ]
    }
}
