//
//  MovieGenresView.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

/*
 SwiftUI view that is responsible to show the Genres of the movie that is sugar coated like a tag view 
 */

import SwiftUI

struct MovieGenresView: View {
    let genres: [MovieGenre]

    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Genres")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())]) {
                    ForEach(genres, id: \.id) { genre in
                        Text(genre.name ?? "")
                            .foregroundColor(.blue)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Capsule().fill(Color.gray.opacity(0.2)))
                    }
                }
            }
        }
    }
}

struct MovieGenresView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGenresView(genres: MovieGenre.dummyGenres())
    }
}
