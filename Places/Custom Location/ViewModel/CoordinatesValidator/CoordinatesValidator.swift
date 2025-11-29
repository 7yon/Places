//
//  CoordinatesValidator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

protocol CoordinatesValidator {
    func isValid(latitude: Double, longitude: Double) -> Bool
}
