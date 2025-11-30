//
//  Coordinator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

/// A coordinator responsible for handling navigation requests.
///
/// `Coordinator` defines the navigation contract for routing users either
/// to internal module destinations (`Route`) or to external deep links
/// (`Deeplink`).
public protocol Coordinator {
    /// Routes the user to an internal destination within the module.
    ///
    /// Use this method to navigate to any supported `Route` such as list
    /// screen or custom-location.
    ///
    /// - Parameter route: The internal route to navigate to.
    func route(to route: Route)

    /// Routes the user to an external destination represented by a deeplink.
    ///
    /// The call is asynchronous and returns a Boolean indicating whether the deeplink
    /// could be successfully handled.
    ///
    /// - Parameter deeplink: The deeplink request.
    /// - Returns: `true` if the deeplink was successfully processed; otherwise `false`.
    func route(to deeplink: Deeplink) async -> Bool
}
