//
//  ApiClient.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

enum ApiError: Error {
    case decodingError
    case invalidStatusCode
    case unknown(Error)
}

protocol ApiClient {
    /// Executes a request with a given path. If error occures, `ApiError` will be thrown.
    ///
    /// - Parameter request: information about request to be made
    /// - Returns: either decoded data or throws `ApiError`
    func execute<T: Decodable>(_ request: Request) async throws -> T
}
