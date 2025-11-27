//
//  PlacesRepositoryImpl.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

class PlacesRepositoryImpl: PlacesRepository {
    private let decoder = JSONDecoder()

    func fetchPlaces() async throws -> PlacesDTO {
        guard let url = URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json") else {
            throw URLError(.badServerResponse)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        let decodedResponse = try decoder.decode(PlacesDTO.self, from: data)

        return decodedResponse
    }
}
