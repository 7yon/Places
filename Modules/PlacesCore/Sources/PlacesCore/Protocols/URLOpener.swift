//
//  URLOpener.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

/// A type capable of opening external URLs.
///
/// `URLOpener` defines the contract for handling URL requests,
/// typically used for navigating outside the app or interacting with
/// system-level URL handling APIs.
public protocol URLOpener {
    /// Attempts to open the provided URL.
    ///
    /// This method performs an asynchronous request to hand off the URL
    /// to the system or an external application. The result indicates
    /// whether the operation was successfully handled.
    ///
    /// - Parameter url: The URL to open.
    /// - Returns: `true` if the URL was successfully opened; otherwise `false`.
    func open(_ url: URL) async -> Bool
}
