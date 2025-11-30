//
//  PlacesRepositoryImpl.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation
import PlacesCore

/// A concrete implementation of `PlacesRepository` that fetches place data via an `ApiClient`.
///
/// `PlacesRepositoryImpl` uses an `ApiClient` to load location data from a network source,
/// decodes it into a `PlacesDTO`, and maps it into an array of `Location` models.
public class PlacesRepositoryImpl: PlacesRepository {
    private let apiClient: ApiClient

    /// Creates a new `PlacesRepositoryImpl` instance with the given API client.
    ///
    /// - Parameter apiClient: The `ApiClient` used to perform network requests.
    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    /// Fetches the list of available places.
    ///
    /// This method performs an asynchronous network request to retrieve
    /// a JSON file (`locations.json`), decodes it into internal DTO, and
    /// converts each entry into a `Location` model.
    ///
    /// - Returns: An array of `Location` objects representing all fetched places.
    /// - Throws: An error if the network request or decoding fails.
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
