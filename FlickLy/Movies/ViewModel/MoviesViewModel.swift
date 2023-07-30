//
//  MoviesViewModel.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

/*
 A view model that is responsible for handling the business logic for the movies.
 */

import Foundation
import SwiftUI

class MoviesViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var statefulState = StatefulState()
    
    private var page: Int = 1
    
    let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol = MoviesRepository()) {
        self.repository = repository
        
        self.statefulState.emptyDataTitle = "No Movies Available"
        self.statefulState.emptyDataCaption = "Try Again"
    }
    
    func reset() {
        self.movies.removeAll()
    }
}

extension MoviesViewModel {
    func fetchMovies() {
        self.statefulState.setUpLoadingState(isEmpty: self.movies.isEmpty)
        self.repository.fetchMovies(page: self.page) { result in
            switch result {
            case .success(let movies):
                self.movies.append(contentsOf: movies)
                
                if !movies.isEmpty {
                    self.page += 1
                    self.statefulState.updateCanLoadMore(canLoadMore: true)
                } else {
                    self.statefulState.updateCanLoadMore(canLoadMore: false)
                }
                
                if self.movies.isEmpty {
                    self.statefulState.setUpEmptyState()
                } else {
                    self.statefulState.setUpFinishedLoading()
                }
            case .failure(let error):
                self.statefulState.setUpFailState(error: error,
                                                  isEmpty: self.movies.isEmpty)
            }
        }
    }
}

