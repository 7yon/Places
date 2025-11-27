//
//  PlacesRepository.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

protocol PlacesRepository {
    func fetchPlaces() async throws -> PlacesDTO
}
