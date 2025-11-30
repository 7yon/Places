//
//  PlacesRepository.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

/// A repository responsible for loading place data.
///
/// `PlacesRepository` defines the data-access contract for retrieving
/// a collection of `Location` models. Implementations may fetch data
/// from local storage, remote services, or any other source.
public protocol PlacesRepository {
    /// Fetches the list of available places.
    ///
    /// This method performs an asynchronous data request and returns all
    /// known `Location` entries. Errors may be thrown if the underlying
    /// data source fails or cannot be reached.
    ///
    /// - Returns: An array of `Location` objects.
    /// - Throws: An error if the fetch operation fails.
    func fetchPlaces() async throws -> [Location]
}
