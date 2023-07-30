//
//  MoviesView.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import SwiftUI
/*
 SwiftUI view that is responsible for showing collection of a movies fetched from the API and displaying it in 3 x 3 Grid.
 This view is stateful view it will handle the different states such as initial loading, initial loading error or load more etc
 */
struct MoviesView: View {
    
    @StateObject var movieViewModel = MoviesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    let gridItem = GridItem(.flexible(), spacing: 8)
                    let columns = Array(repeating: gridItem, count: 3)
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(movieViewModel.movies) { movie in
                            NavigationLink(destination: MovieDetailsView(movie: movie)) {
                                MovieItemView(movie: movie)
                                    .padding(.vertical, 4).onAppear {
                                        
                                        let statefulState = movieViewModel.statefulState
                                        let isLast = movie.id == movieViewModel.movies.last?.id
                                        
                                        if isLast,
                                           !statefulState.isLoading,
                                           statefulState.canLoadMore {
                                            movieViewModel.fetchMovies()
                                        }
                                    }
                            }.foregroundColor(Color(.label))
                        }
                    }
                    
                    let statefulState = movieViewModel.statefulState
                    StatefulLoadingAndErrorView(currentState: statefulState) {
                        movieViewModel.fetchMovies()
                    }
                    
                }.padding(8)
            }
            .navigationTitle("Discover")
            .onAppear {
                self.movieViewModel.fetchMovies()
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
