//
//  Location.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import Foundation

struct Location: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String?
    let latitude: Double
    let longitude: Double
}

extension Location {
    static let amsterdam = Location(name: "Amsterdam", latitude: 52.3702, longitude: 4.8951)

    static let newYork = Location(name: "New York", latitude: 40.7128, longitude: -74.0060)

    static let london = Location(name: "London", latitude: 51.5074, longitude: -0.1278)

    static let unknown = Location(name: nil, latitude: 52.5200, longitude: 13.4050)
}
