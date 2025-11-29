//
//  PlacesApp.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import SwiftUI
import NeedleFoundation

@main
struct PlacesApp: App {
    let environment: AppEnvironment = .production

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            let rootComponent = RootComponent(environment: environment)

            return RootView(coordinator: rootComponent.appCoordinator)
        }
    }
}
