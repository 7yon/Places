//
//  WGS84CoordinatesValidator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import MapKit

public struct WGS84CoordinatesValidator: CoordinatesValidator {
    public init() {

    }

    public func isValid(latitude: Double, longitude: Double) -> Bool {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return CLLocationCoordinate2DIsValid(coordinate)
    }
}
