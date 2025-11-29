//
//  CoordinatorComponent.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import NeedleFoundation
import SwiftUI
import PlacesCore

protocol CoordinatorDependency: Dependency {
    var urlOpener: URLOpener { get }
}

protocol CoordinatorViewResolver {
    var listView: AnyView { get }
    var customLocationView: AnyView { get }
}

@Observable
nonisolated class CoordinatorComponent: Component<CoordinatorDependency>, CoordinatorViewResolver {
    @MainActor
    var appCoordinator: AppCoordinator {
        shared {
            AppCoordinator(viewResolver: self, urlOpener: dependency.urlOpener)
        }
    }

    var listView: AnyView {
        AnyView(ListComponent(parent: self).view)
    }

    var customLocationView: AnyView {
        AnyView(CustomLocationComponent(parent: self).view)
    }
}
