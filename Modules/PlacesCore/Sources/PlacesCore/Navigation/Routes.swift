//
//  Route.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

public enum Route: Hashable, Codable {
    case placesList
    case customLocation
}

public enum Deeplink: Hashable, Codable {
    case wikipedia(latitude: Double, longitude: Double)
}
