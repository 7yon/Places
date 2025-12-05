//
//  ApiClient.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

/// An error type representing failures that can occur when interacting with an API.
///
/// `ApiError` encapsulates common error conditions such as decoding failures,
/// unexpected status codes, or unknown underlying errors. Additional cases
/// can be added to support more precise error handling.
public enum ApiError: Error {
    /// Indicates that the response payload could not be decoded into the expected model.
    case decodingError
    /// Indicates that the API response returned an invalid or unexpected status code.
    case invalidStatusCode
    /// Wraps any unclassified or unexpected underlying error.
    ///
    /// - Parameter error: The originating error providing more context.
    case unknown(Error)

    // Add more cases as needed to provide more granular error handling.
}

/// An environment-aware API client for performing network requests.
///
/// `ApiClient` defines the contract for executing network calls, handling
/// response decoding, and reporting errors using `ApiError`. Implementations
/// can be environment-specific (e.g., mock, staging, production).
public protocol ApiClient {
    /// Executes the specified network request and decodes the response.
    ///
    /// This method performs an asynchronous request using the information
    /// provided in `Request`. The response is decoded into the expected
    /// `Decodable` type `T`. Errors are thrown if the request fails or the
    /// response is invalid.
    ///
    /// - Parameter request: The request to execute, including endpoint path
    ///   and any other relevant request information.
    /// - Returns: The decoded response of type `T`.
    /// - Throws: An `ApiError` if the network request fails, the response
    ///   status code is invalid, or decoding the response fails.
    func execute<T: Decodable>(_ request: Request) async throws(ApiError) -> T
}
