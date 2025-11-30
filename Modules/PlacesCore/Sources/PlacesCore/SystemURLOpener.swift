//
//  SystemURLOpener.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation
import UIKit

/// A concrete implementation of `URLOpener` that opens URLs using the system.
///
/// `SystemURLOpener` leverages `UIApplication.shared.open` to navigate
/// to external URLs from within the app. This class is suitable for handling
/// outbound links to websites or other apps.
public class SystemURLOpener: URLOpener {
    /// Creates a new `SystemURLOpener` instance.
    public init() { }

    /// Opens the specified URL using the system.
    ///
    /// This method asynchronously hands off the URL to the system, allowing
    /// navigation outside the app (e.g., to Safari or another app). The call
    /// executes on the main actor.
    ///
    /// - Parameter url: The URL to open.
    /// - Returns: `true` if the URL was successfully opened; otherwise `false`.
    public func open(_ url: URL) async -> Bool {
        await withCheckedContinuation { continuation in
            Task { @MainActor in
                UIApplication.shared.open(url, options: [:]) { result in
                    continuation.resume(returning: result)
                }
            }
        }
    }
}
