//
//  MockPlacesRepository.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
import PlacesCore

class MockPlacesRepository: PlacesRepository {
    let places: [Location]
    let error: Error?

    init(places: [Location] = [.amsterdam, .london, .unknown], error: Error? = nil) {
        self.places = places
        self.error = error
    }

    func fetchPlaces() async throws -> [Location] {
        if let error {
            throw error
        }

        return places
    }
}
