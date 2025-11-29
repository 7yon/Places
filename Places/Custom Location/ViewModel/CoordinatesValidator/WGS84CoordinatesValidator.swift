//
//  WGS84CoordinatesValidator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import MapKit

struct WGS84CoordinatesValidator: CoordinatesValidator {
    func isValid(latitude: Double, longitude: Double) -> Bool {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return CLLocationCoordinate2DIsValid(coordinate)
    }
}
