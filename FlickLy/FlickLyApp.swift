//
//  FlickLyApp.swift
//  FlickLy
//
//  Created by Muhammad Zeeshan on 29/07/2023.
//

import SwiftUI

@main
struct FlickLyApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = AppConfiguration.environment
            MoviesView()
        }
    }
}
