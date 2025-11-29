//
//  PlacesApp.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import SwiftUI
import NeedleFoundation

enum AppEnvironment {
    struct Configuration {
        let baseURL: URL
    }

    case production

    var configuration: Configuration {
        switch self {
        case .production:
            guard let url = URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/") else {
                fatalError("Invalid URL in production env")
            }
            return Configuration(baseURL: url)
        }
    }
}

@main
struct PlacesApp: App {
    let environment: AppEnvironment = .production

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            return RootComponent(environment: .production).listComponent.view
        }
    }
}
