//
//  ListComponent.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
import NeedleFoundation

protocol ListDependency: Dependency {
    var urlOpener: any URLOpener { get }
    var apiClient: ApiClient { get }
}

nonisolated class ListComponent: Component<ListDependency> {
    @MainActor
    var coordinator: PlacesCoordinator {
        PlacesCoordinator(urlOpener: dependency.urlOpener)
    }

    @MainActor
    var repository: PlacesRepository {
        PlacesRepositoryImpl(apiClient: dependency.apiClient)
    }

    @MainActor
    var viewModel: PlacesViewModel {
        PlacesViewModel(repository: repository,
                        coordinator: coordinator)
    }

    @MainActor
    var view: PlacesListView {
        PlacesListView(viewModel: viewModel)
    }
}
