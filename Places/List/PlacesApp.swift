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

    var body: some Scene {
        WindowGroup {
            registerProviderFactories()
            let rootComponent = RootComponent()
            return rootComponent.listComponent.view
        }
    }
}
