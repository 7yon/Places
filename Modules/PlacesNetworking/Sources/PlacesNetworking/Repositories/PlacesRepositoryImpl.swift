//
//  PlacesRepositoryImpl.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation
import PlacesCore

public class PlacesRepositoryImpl: PlacesRepository {
    private let apiClient: ApiClient

    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    public func fetchPlaces() async throws -> [Location] {
        let request = Request(path: "locations.json")
        let places: PlacesDTO = try await apiClient.execute(request)

        let locations = places.locations.map {
            Location(name: $0.name,
                     latitude: $0.latitude,
                     longitude: $0.longitude)
        }

        return locations
    }
}
