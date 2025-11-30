//
//  Request.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

/// Represents a network request with a specific path.
///
/// `Request` encapsulates the information needed to construct a network call,
/// primarily the endpoint path. This type can be extended in the future to
/// include query parameters, headers, or body data.
public struct Request {
    /// The path of the network request.
    ///
    /// Typically represents the relative URL or endpoint for the request.
    public let path: String

    /// Creates a new `Request` instance with the specified path.
    ///
    /// - Parameter path: The relative URL or endpoint path for the request.
    public init(path: String) {
        self.path = path
    }
}
