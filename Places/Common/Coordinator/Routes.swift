//
//  Route.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

enum Route: Hashable, Codable {
    case placesList
    case customLocation
}

enum Deeplink: Hashable, Codable {
    case wikipedia(latitude: Double, longitude: Double)
}
