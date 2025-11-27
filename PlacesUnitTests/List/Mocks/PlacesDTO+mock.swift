//
//  PlacesDTO+mock.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
@testable import Places

extension PlacesDTO {
    static let mock: PlacesDTO = .init(locations: [
        .init(name: "Amsterdam", latitude: 52.370216, longitude: 4.895168),
        .init(name: "Berlin", latitude: 52.520008, longitude: 13.404954),
        .init(name: nil, latitude: 51.507351, longitude: -0.127758)
    ])
}
