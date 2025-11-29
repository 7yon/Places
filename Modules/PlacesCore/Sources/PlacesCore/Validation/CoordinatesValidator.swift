//
//  CoordinatesValidator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

public protocol CoordinatesValidator {
    func isValid(latitude: Double, longitude: Double) -> Bool
}
