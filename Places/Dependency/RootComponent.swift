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

    var listComponent: ListComponent {
        ListComponent(parent: self)
    }
}
