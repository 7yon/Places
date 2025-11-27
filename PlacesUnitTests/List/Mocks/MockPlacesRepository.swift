//
//  MockPlacesRepository.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
@testable import Places

class MockPlacesRepository: PlacesRepository {
    let places: PlacesDTO
    let error: Error?

    init(places: PlacesDTO = .mock, error: Error? = nil) {
        self.places = places
        self.error = error
    }

    func fetchPlaces() async throws -> PlacesDTO {
        if let error {
            throw error
        }

        return places
    }
}
