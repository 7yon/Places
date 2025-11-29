//
//  Location.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import Foundation

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
