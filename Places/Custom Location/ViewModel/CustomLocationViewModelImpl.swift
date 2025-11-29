//
//  CustomLocationViewModel.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import PlacesCore

@Observable
class CustomLocationViewModelImpl: CustomLocationViewModel {
    var latitude: String = ""
    var longitude: String = ""

    private var validLatitude: Double?
    private var validLongitude: Double?

    var activeAlert: LocalizedStringResource = ""

    private let numberFormatter = NumberFormatter()
    private let coordinatesValidator: CoordinatesValidator
    private let coordinator: Coordinator

    init(coordinatesValidator: CoordinatesValidator, coordinator: Coordinator) {
        self.coordinatesValidator = coordinatesValidator
        self.coordinator = coordinator
    }

    var coordinatesAreValid: Bool {
        guard !latitude.isEmpty, !longitude.isEmpty,
              let latitude = numberFormatter.number(from: latitude)?.doubleValue,
              let longitude = numberFormatter.number(from: longitude)?.doubleValue
        else {
            return false
        }

        let result = coordinatesValidator.isValid(latitude: latitude, longitude: longitude)

        validLatitude = result ? latitude : nil
        validLongitude = result ? longitude : nil

        return result
    }

    func didSelectOpenInWikipedia() async {
        guard coordinatesAreValid,
              let validLatitude,
              let validLongitude else {
            return
        }

        let result = await coordinator.route(to: .wikipedia(latitude: validLatitude,
                                                            longitude: validLongitude))

        if !result {
            activeAlert = .placesListAlertNoWikipedia
        }
    }

    func didCloseAlert() {
        activeAlert = ""
    }
}
