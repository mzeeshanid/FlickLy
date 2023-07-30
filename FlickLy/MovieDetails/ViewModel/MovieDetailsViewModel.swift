//
//  MovieDetailsViewModel.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

/*
 A view model that is responsible for handling the business logic for the movie details.
 */

import Foundation
import SwiftUI

class MovieDetailsViewModel: ObservableObject {
    
    @Published var details: MovieDetails?
    
    @Published var statefulState = StatefulState()
    
    let repository: MovieDetailRepositoryProtocol
    
    let movie: Movie
    
    init(repository: MovieDetailRepositoryProtocol = MovieDetailRepository(),
         movie: Movie) {
        self.repository = repository
        self.movie = movie
    }
}


extension MovieDetailsViewModel {
    func fetchMovieDetails() {
        self.statefulState.setUpLoadingState(isEmpty: false)
        self.repository.fetchMovieDetails(id: self.movie.id) { result in
            switch result {
            case .success(let details):
                self.details = details
                self.statefulState.setUpFinishedLoading()

            case .failure(let error):
                self.statefulState.setUpFailState(error: error,
                                                  isEmpty: false)
            }
        }
    }
}
