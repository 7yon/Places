//
//  File.swift
//  PlacesNetworking
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import PlacesNetworking

class MockAPiClient: ApiClient {
    private(set) var fetchPlacesCalled: Bool = false
    private let fetchPlacesResult: Result<[T], Error>

    init(fetchPlacesResult: Result<[T], Error>) {
        self.fetchPlacesResult = fetchPlacesResult
    }

    func execute<T: Decodable>(_ request: Request) async throws -> T {
        switch fetchPlacesResult {
        case .success(let value)
            return value
        case .failure(let error):
            throw error
        }
    }
}
