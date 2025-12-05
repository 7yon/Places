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
    private let fetchPlacesResult: Result<Any, ApiError>

    init(fetchPlacesResult: Result<Any, ApiError>) {
        self.fetchPlacesResult = fetchPlacesResult
    }

    func execute<T: Decodable>(_ request: Request) async throws(ApiError) -> T {
        switch fetchPlacesResult {
        case .success(let value):
            guard let value = value as? T else {
                fatalError("Not a correct type")
            }

            return value
        case .failure(let error):
            throw error
        }
    }
}
