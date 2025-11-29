//
//  CustomLocationViewModel.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

@Observable
class CustomLocationViewModelImpl: CustomLocationViewModel {
    var latitude: String = ""
    var longitude: String = ""

    var coordinatesAreValid: Bool = false

    private let coordinatesValidator: CoordinatesValidator

    init(coordinatesValidator: CoordinatesValidator) {
        self.coordinatesValidator = coordinatesValidator
    }

    func coordinatesDidChange(latitude: String, longitude: String) {
        guard !latitude.isEmpty, !longitude.isEmpty else {
            coordinatesAreValid = false
            return
        }

        let latitude = Double(latitude) ?? 0.0
        let longitude = Double(longitude) ?? 0.0

        coordinatesAreValid = coordinatesValidator.isValid(latitude: latitude, longitude: longitude)
    }
}
