//
//  Location.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import Foundation

/// A simple, value-type representation of a geographic place.
///
/// `Location` identifies a point on Earth by its latitude and longitude and
/// optionally associates a human‑readable `name`. It conforms to `Identifiable`,
/// `Hashable`, and `Equatable` so it can be used directly in SwiftUI lists,
/// sets, dictionaries, and for comparison.
///
/// - Note: The `id` is generated as a new `UUID` for each instance, so two
///   `Location` values with the same coordinates and name will be considered
///   equal by value (via `Equatable`) but still have distinct identities for
///   SwiftUI (`Identifiable`).
///
/// - Parameters:
///   - name: An optional display name for the location (e.g., a city name).
///   - latitude: The latitude in decimal degrees. Positive values indicate the
///     northern hemisphere; negative values indicate the southern hemisphere.
///   - longitude: The longitude in decimal degrees. Positive values indicate the
///     eastern hemisphere; negative values indicate the western hemisphere.
public struct Location: Identifiable, Hashable, Equatable {
    public let id = UUID()
    public let name: String?
    public let latitude: Double
    public let longitude: Double

    public init(name: String?, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}

public extension Location {
    static let amsterdam = Location(name: "Amsterdam", latitude: 52.3702, longitude: 4.8951)
    static let newYork = Location(name: "New York", latitude: 40.7128, longitude: -74.0060)
    static let london = Location(name: "London", latitude: 51.5074, longitude: -0.1278)
    static let unknown = Location(name: nil, latitude: 52.5200, longitude: 13.4050)
}
