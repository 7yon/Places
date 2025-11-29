//
//  LocationDTO.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import Foundation

struct LocationDTO: Codable {
    let name: String?
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "long"
    }
}
