//
//  URLSessionApiClient.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

public class URLSessionApiClient: ApiClient {
    private let config: Configuration
    private let session = URLSession.shared
    private let decoder = JSONDecoder()

    public init(config: Configuration) {
        self.config = config
    }

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
