//
//  AppCoordinator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import SwiftUI
import NeedleFoundation
import PlacesCore

@Observable
nonisolated class AppCoordinator: Coordinator {

    var path = NavigationPath()

    private let viewResolver: CoordinatorViewResolver
    private let urlOpener: URLOpener

    init(viewResolver: CoordinatorViewResolver, urlOpener: URLOpener) {
        self.viewResolver = viewResolver
        self.urlOpener = urlOpener
    }

    func route(to route: Route) {
        path.append(route)
    }

    @ViewBuilder
    @MainActor
    func view(for route: Route) -> some View {
        switch route {
        case .placesList:
            viewResolver.listView
        case .customLocation:
            viewResolver.customLocationView
        }
    }

    func route(to deeplink: Deeplink) async -> Bool {
        switch deeplink {
        case .wikipedia(let latitude, let longitude):
            guard let url = URL(string: "wikipedia://places?latitude=\(latitude)&longitude=\(longitude)") else {
                return false
            }
            return await urlOpener.open(url)
        }
    }
}
