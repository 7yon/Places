//
//  PlacesRepository.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

public protocol PlacesRepository {
    func fetchPlaces() async throws -> [Location]
}
