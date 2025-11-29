//
//  CustomLocationComponent.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import NeedleFoundation

protocol CustomLocationDependency: Dependency {

}

nonisolated class CustomLocationComponent: Component<EmptyDependency> {

    @MainActor
    var coordinatesValidator: CoordinatesValidator {
        WGS84CoordinatesValidator()
    }

    @MainActor
    var viewModel: CustomLocationViewModel {
        CustomLocationViewModelImpl(coordinatesValidator: coordinatesValidator)
    }

    @MainActor
    var view: CustomLocationView {
        CustomLocationView(viewModel: viewModel)
    }
}
