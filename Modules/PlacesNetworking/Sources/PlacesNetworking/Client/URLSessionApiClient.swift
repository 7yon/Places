//
//  URLSessionApiClient.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

/// An `ApiClient` implementation using `URLSession` for network requests.
///
/// `URLSessionApiClient` performs network requests against a configured
/// base URL, decodes JSON responses into `Decodable` types, and reports
/// errors using `ApiError`.
public class URLSessionApiClient: ApiClient {
    private let config: Configuration
    private let session = URLSession.shared
    private let decoder = JSONDecoder()

    /// Creates a new `URLSessionApiClient` with the given configuration.
    ///
    /// - Parameter config: Configuration containing the base URL and any
    ///   other environment-specific settings.
    public init(config: Configuration) {
        self.config = config
    }

    /// Executes the specified network request and decodes the response.
    ///
    /// This method constructs the full URL by appending `request.path` to
    /// the configured base URL, fetches the data asynchronously, and decodes
    /// it into the expected `Decodable` type `T`. Errors are thrown if the
    /// request fails, the response status code is invalid, or decoding fails.
    ///
    /// - Parameter request: The request to execute.
    /// - Returns: The decoded response of type `T`.
    /// - Throws: An `ApiError` if the network request fails, the status code
    ///   is not in the 2xx range, or decoding fails.
    public func execute<T: Decodable>(_ request: Request) async throws -> T {
        let url = config.baseURL.appending(path: request.path)

        let (data, _) = try await data(from: url)

        let decodedResponse = try decode(T.self, from: data)

        return decodedResponse
    }

    private func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            let decodedResponse = try decoder.decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw ApiError.decodingError
        }
    }

    private func data(from url: URL) async throws -> (Data, URLResponse) {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
                throw ApiError.invalidStatusCode
            }
            return (data, response)
        } catch {
            throw ApiError.unknown(error)
        }
    }
}
