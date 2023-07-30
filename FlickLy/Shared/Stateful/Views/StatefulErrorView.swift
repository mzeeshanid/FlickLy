//
//  StatefulErrorView.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import SwiftUI

struct StatefulErrorView: View {
    let title: String
    let caption: String
    let canRetry: Bool
    
    let onRetryTapped: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title).font(.headline)
                .multilineTextAlignment(.center)
            
            Text(caption).font(.caption)
                .multilineTextAlignment(.center)
            
            if canRetry {
                Button ("Retry") {
                    onRetryTapped?()
                }
            }
        }
    }
}

struct StatefulErrorView_Previews: PreviewProvider {
    static var previews: some View {
        return StatefulErrorView(title: "Internet connection appears to be offline",
                                 caption: "Tap to retry",
                                 canRetry: true) {
            debugPrint("Retried")
        }
    }
}
