//
//  StatefulEmptyDataView.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import SwiftUI

struct StatefulEmptyDataView: View {
    
    let title: String
    let caption: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(caption)
                .foregroundColor(.gray)
        }
    }
}
