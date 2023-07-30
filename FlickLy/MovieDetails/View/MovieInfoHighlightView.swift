//
//  MovieInfoHighlightView.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 30/07/2023.
//

/*
 SwiftUI view that is responsible for highlighting important information about the movie. An eye catching info of user's interest.
 */

import SwiftUI

struct MovieInfoHighlightView: View {
    
    let title: String
    let caption: String
    let iconName: String
    
    let iconColor: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 24.0, height: 24.0)
                .foregroundColor(iconColor)
            
            Text(title)
                .font(.headline)
                .lineLimit(1)
            
            Text(caption)
                .lineLimit(1)
                .foregroundColor(Color(.label))
        }
    }
}

struct MovieInfoHighlightView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoHighlightView(title: "Rating",
                               caption: "7.5",
                               iconName: "star.fill",
                               iconColor: Color(.systemYellow))
    }
}
