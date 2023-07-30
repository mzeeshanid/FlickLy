//
//  MovieItemView.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

import SwiftUI

/*
 SwiftUI view that represents the single item in the collection of Movies
 */

struct MovieItemView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: movie.posterUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150.0)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
            }.background(Color(.tertiarySystemFill))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text("\(movie.year)")
                    .foregroundColor(Color(.secondaryLabel))
                    .lineLimit(1)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .frame(width: 20.0, height: 20.0)
                        .foregroundColor(Color(.systemYellow))
                    Text("\(String(format: "%.1f", movie.voteAverage))")
                        .lineLimit(1)
                        .foregroundColor(Color(.label))
                }
            }.padding(8)
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8.0)
        
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(movie: Movie.dummyMovie1())
    }
}
