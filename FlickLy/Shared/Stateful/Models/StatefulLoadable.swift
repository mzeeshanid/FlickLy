//
//  StatefulLoadable.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import Foundation

enum StatefulLoadingState: String {
    case none
    case emptyData
    case initialLoading
    case initialLoadError
    case loadingMore
    case loadingMoreError
    case refreshing
}

protocol StatefulLoadable: AnyObject {
    var loadingState: StatefulLoadingState { get set }
    var isLoading: Bool { get }
    var canLoadMore: Bool { get set }
    var loadingError: Error? { get set }
}
