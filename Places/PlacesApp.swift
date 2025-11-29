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
            return RootComponent(environment: .production).listComponent.view
        }
    }
}
