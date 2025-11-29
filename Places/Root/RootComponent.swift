//
//  RootComponent.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
import NeedleFoundation
import PlacesCore

nonisolated class RootComponent: BootstrapComponent {
    public let environment: AppEnvironment

    init(environment: AppEnvironment) {
        self.environment = environment
        super.init()
    }

    @MainActor
    public var urlOpener: URLOpener {
        SystemURLOpener()
    }

    @MainActor
    public var apiClient: ApiClient {
        return URLSessionApiClient(config: environment.configuration)
    }

    var coordinatorComponent: CoordinatorComponent {
        CoordinatorComponent(parent: self)
    }

    @MainActor
    var appCoordinator: AppCoordinator {
        shared {
            coordinatorComponent.appCoordinator
        }
    }

    @MainActor
    public var coordinator: Coordinator {
        appCoordinator
    }
}
