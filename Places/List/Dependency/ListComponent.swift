//
//  ListComponent.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
import NeedleFoundation

protocol ListDependency: Dependency {
    var apiClient: ApiClient { get }
    var coordinator: Coordinator { get }
}

nonisolated class ListComponent: Component<ListDependency> {

    @MainActor
    var repository: PlacesRepository {
        PlacesRepositoryImpl(apiClient: dependency.apiClient)
    }

    @MainActor
    var viewModel: PlacesViewModel {
        PlacesViewModel(repository: repository,
                        coordinator: dependency.coordinator)
    }

    @MainActor
    var view: PlacesListView {
        PlacesListView(viewModel: viewModel)
    }
}
