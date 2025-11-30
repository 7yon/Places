//
//  CoordinatesValidator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

/// A type responsible for validating geographic coordinates.
///
/// `CoordinatesValidator` defines a contract for checking whether a given
/// latitude/longitude pair represents a valid geographic location.
public protocol CoordinatesValidator {
    /// Determines whether the provided geographic coordinates are valid.
    ///
    /// Use this method to validate input before creating locations,
    /// performing lookups, or constructing deeplinks.
    ///
    /// - Parameters:
    ///   - latitude: The latitude value to validate.
    ///   - longitude: The longitude value to validate.
    /// - Returns: `true` if the coordinates are valid; otherwise `false`.
    func isValid(latitude: Double, longitude: Double) -> Bool
}
