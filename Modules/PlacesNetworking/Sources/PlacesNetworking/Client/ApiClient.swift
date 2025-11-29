//
//  ApiClient.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

public enum ApiError: Error {
    case decodingError
    case invalidStatusCode
    case unknown(Error)

    // Add more cases as needed to provide more granular error handling.
}

/// An environment-aware API client for performing network requests.
public protocol ApiClient {
    /// Executes the specified request. Throws an `ApiError` if the operation fails.
    ///
    /// - Parameter request: Information describing the request to perform.
    /// - Returns: The decoded response of type `T`.
    /// - Throws: An `ApiError` if the response is invalid or decoding fails.
    func execute<T: Decodable>(_ request: Request) async throws -> T
}
