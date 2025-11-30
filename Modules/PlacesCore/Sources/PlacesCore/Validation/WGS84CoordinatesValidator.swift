//
//  WGS84CoordinatesValidator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import MapKit

/// A validator for geographic coordinates based on the WGS84 reference system.
///
/// `WGS84CoordinatesValidator` checks whether a latitude/longitude pair
/// represents a valid coordinate using `CLLocationCoordinate2D` validation
/// rules from Core Location.
public struct WGS84CoordinatesValidator: CoordinatesValidator {
    /// Creates a new `WGS84CoordinatesValidator` instance.
    public init() { }

    /// Determines whether the provided geographic coordinates are valid
    /// according to the WGS84 reference system.
    ///
    /// The validation uses `CLLocationCoordinate2DIsValid`, ensuring the
    /// values fall within standard geographic bounds.
    ///
    /// - Parameters:
    ///   - latitude: The latitude to validate.
    ///   - longitude: The longitude to validate.
    /// - Returns: `true` if the coordinates are valid; otherwise `false`.
    public func isValid(latitude: Double, longitude: Double) -> Bool {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return CLLocationCoordinate2DIsValid(coordinate)
    }
}
