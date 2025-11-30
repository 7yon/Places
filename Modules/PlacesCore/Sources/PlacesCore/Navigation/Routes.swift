//
//  Route.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

/// A navigation destination within the module.
///
/// `Route` defines all supported screens and is used to drive navigation
/// across the feature. It conforms to `Hashable` and `Codable`, allowing it
/// to be stored in navigation stacks, persisted, or encoded/decoded as part
/// of app state.
public enum Route: Hashable, Codable {
    /// Displays the list of available places.
    ///
    /// Use this route to navigate to the main overview showing all place entries.
    case placesList

    /// Opens the screen for defining a custom location using latitude and longitude.
    ///
    /// Use this route to navigate to the custom locations screen.
    case customLocation
}

/// A deeplink target that routes users to an external destination.
///
/// `Deeplink` models outbound navigation actions triggered within the module.
/// It conforms to `Hashable` and `Codable`, allowing it to be passed through
/// routing layers, stored, or encoded in app state if needed.
public enum Deeplink: Hashable, Codable {
    /// Opens the corresponding Wikipedia app with Places tab open, focusing on the passed coordinates.
    ///
    /// This deeplink is used to leave the app and direct the user to the Wikipedia app associated with the provided location.
    ///
    /// - Parameters:
    ///   - latitude: The latitude of the referenced location.
    ///   - longitude: The longitude of the referenced location.
    case wikipedia(latitude: Double, longitude: Double)
}
