//
//  File.swift
//  PlacesNetworking
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

/// Holds configuration settings for network-related components.
///
/// `Configuration` provides environment-specific settings, such as the
/// base URL used by `ApiClient` implementations to construct network requests.
public struct Configuration {
    /// The base URL used for constructing network requests.
    public let baseURL: URL

    /// Creates a new `Configuration` instance with the specified base URL.
    ///
    /// - Parameter baseURL: The base URL to use for all network requests.
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
}
