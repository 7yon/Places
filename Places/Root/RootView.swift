//
//  CoordinatorView.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import PlacesCore
import SwiftUI

struct RootView: View {
    @State private var coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.view(for: .placesList)
                .navigationDestination(for: Route.self) { route in
                    coordinator.view(for: route)
                }
        }
    }
}
