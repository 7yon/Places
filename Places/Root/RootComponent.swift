//
//  RootComponent.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
import NeedleFoundation

nonisolated class RootComponent: BootstrapComponent {
    public let environment: AppEnvironment

    init(environment: AppEnvironment) {
        self.environment = environment
        super.init()
    }

    @MainActor
    public var urlOpener: any URLOpener {
        SystemURLOpener()
    }

    @MainActor
    public var apiClient: ApiClient {
        return URLSessionApiClient(config: environment.configuration)
    }

    public var listComponent: ListComponent {
        ListComponent(parent: self)
    }

    public var customLocation: CustomLocationComponent {
        CustomLocationComponent(parent: self)
    }

    @MainActor
    var appCoordinator: AppCoordinator {
        shared {
            AppCoordinator(rootComponent: self,
                           urlOpener: urlOpener)
        }
    }

    @MainActor
    public var coordinator: Coordinator {
        appCoordinator
    }
}
