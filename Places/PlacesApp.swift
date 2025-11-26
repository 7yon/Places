//
//  PlacesApp.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import SwiftUI

@main
struct PlacesApp: App {
    var body: some Scene {
        WindowGroup {
            PlacesListView(viewModel: PlacesViewModel(repository: PlacesRepositoryImpl(),
                                                      coordinator: PlacesCoordinator(urlOpener: SystemURLOpener())))
        }
    }
}
