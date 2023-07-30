//
//  StatefulLoadingAndErrorView.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation
import SwiftUI

struct StatefulLoadingAndErrorView: View {
    
    @StateObject var currentState: StatefulState
    
    let onRetryTapped: (() -> Void)?
    
    var body: some View {
        VStack {
            switch self.currentState.loadingState {
            case .initialLoading, .loadingMore:
                ProgressView("Loading...")
            case .emptyData:
                StatefulEmptyDataView(title: currentState.emptyDataTitle,
                                      caption: currentState.emptyDataCaption)
            case .initialLoadError, .loadingMoreError:
                StatefulErrorView(title: currentState.loadingError?.localizedDescription ?? "",
                                  caption: "Tap to retry",
                                  canRetry: true,
                                  onRetryTapped: onRetryTapped)
            default:
                EmptyView()
            }
        }
    }
}

struct StatefulLoadingAndErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let state = StatefulState()
        state.setUpEmptyState()
        return StatefulLoadingAndErrorView(currentState: state,
                                           onRetryTapped: nil)
    }
}
