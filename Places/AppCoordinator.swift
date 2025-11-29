//
//  AppCoordinator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case placesList
    case customLocation
}

enum Deeplink: Hashable {
    case wikipedia(latitude: Double, longitude: Double)
}

protocol Coordinator {
    func route(to route: Route)
    func route(to deeplink: Deeplink) async -> Bool
}

@Observable
class AppCoordinator: Coordinator {
    var path = NavigationPath()

    private let rootComponent: RootComponent

    private let urlOpener: URLOpener

    init(rootComponent: RootComponent,
         urlOpener: URLOpener) {
        self.rootComponent = rootComponent
        self.urlOpener = urlOpener
    }

    func route(to route: Route) {
        path.append(route)
    }

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .placesList:
            rootComponent.listComponent.view
        case .customLocation:
            rootComponent.customLocation.view
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
