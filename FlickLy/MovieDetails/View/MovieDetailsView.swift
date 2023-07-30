//
//  MovieDetailsView.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

/*
 SwiftUI view that is responsible to show the details of the movie. When user tap on the movie item from the GridView. User will be navigate to this view and short details will be displayed from the received movie object and API will be hit for fetching details. When details are fetched this view will update it self to reflect the more details about the movie.
 */

import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject var movieViewModel: MovieDetailsViewModel
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        let viewModel = MovieDetailsViewModel(movie: movie)
        _movieViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                AsyncImage(url: movieViewModel.details?.posterUrl!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 350)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 350,
                               maxHeight: .infinity)
                }.background(Color(.tertiarySystemFill))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()

                    Text(movieViewModel.details?.tagline ?? "")
                        .foregroundColor(Color(.secondaryLabel))

                    if let genres = movieViewModel.details?.genres {
                        MovieGenresView(genres: genres)
                    }
                    
                    HStack(spacing: 8) {
                        
                        let rating = "\(String(format: "%.1f", movie.voteAverage))"
                        MovieInfoHighlightView(title: "Rating",
                                               caption: rating,
                                               iconName: "star.fill",
                                               iconColor: Color(.systemYellow))
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: .infinity)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        
                        let votes = "\(movie.voteCount)"
                        MovieInfoHighlightView(title: "Votes",
                                               caption: votes,
                                               iconName: "hand.thumbsup.fill",
                                               iconColor: Color(.label))
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: .infinity)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        
                        let year = movie.year
                        MovieInfoHighlightView(title: "Year",
                                               caption: year,
                                               iconName: "calendar",
                                               iconColor: Color(.systemBlue))
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: .infinity)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        
                    }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    
                    Text(movieViewModel.details?.overview ?? "")
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding()
                
                VStack(alignment: .center) {
                    let statefulState = movieViewModel.statefulState
                    StatefulLoadingAndErrorView(currentState: statefulState) {
                        movieViewModel.fetchMovieDetails()
                    }
                }
                .frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity)
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            movieViewModel.fetchMovieDetails()
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie.dummyMovie1())
    }
}
