//
//  CustomLocationComponent.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import NeedleFoundation

protocol CustomLocationDependency: Dependency {
    var coordinator: Coordinator { get }
}

nonisolated class CustomLocationComponent: Component<CustomLocationDependency> {

    @MainActor
    var coordinatesValidator: CoordinatesValidator {
        WGS84CoordinatesValidator()
    }

    @MainActor
    var viewModel: CustomLocationViewModel {
        CustomLocationViewModelImpl(coordinatesValidator: coordinatesValidator,
                                    coordinator: dependency.coordinator)
    }

    @MainActor
    var view: CustomLocationView {
        CustomLocationView(viewModel: viewModel)
    }
}
