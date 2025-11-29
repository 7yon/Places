//
//  PlacesRepositoryImpl.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

class PlacesRepositoryImpl: PlacesRepository {
    private let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func fetchPlaces() async throws -> PlacesDTO {
        let request = Request(path: "locations.json")
        let places: PlacesDTO = try await apiClient.execute(request)

        return places
    }
}
