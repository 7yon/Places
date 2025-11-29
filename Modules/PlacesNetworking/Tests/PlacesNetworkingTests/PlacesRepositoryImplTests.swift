//
//  PlacesRepositoryImplTests.swift
//  PlacesNetworking
//
//  Created by Daria Simenkova on 29.11.25.
//

import XCTest
@testable import PlacesNetworking

final class PlacesRepositoryImplTests: XCTestCase {

    func testSuccessResponse() async throws {
        let placesDTO = PlacesDTO(locations: [.init(name: "London", latitude: 23.0, longitude: 0.0)])
        let apiClient = MockAPiClient(fetchPlacesResult: .success(placesDTO))
        let repository = PlacesRepositoryImpl(apiClient: apiClient)

        let locations = awaitrepository.fetchPlaces()

        XCTAssertTrue(locations.count == 1)
        XCTAssertEqual(locations.first?.name, "London")
        XCTAssertEqual(locations.first?.latitude, 23.0)
        XCTAssertEqual(locations.first?.longitude, 0.0)
    }
}
