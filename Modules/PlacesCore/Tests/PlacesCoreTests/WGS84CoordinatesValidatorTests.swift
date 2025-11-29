//
//  WGS84CoordinatesValidatorTests.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import XCTest
@testable import PlacesCore

final class WGS84CoordinatesValidatorTests: XCTestCase {
    private let validLatitude: ClosedRange<Double> = -90.0...90.0
    private let validLongitude: ClosedRange<Double> = -180.0...180.0

    let validator = WGS84CoordinatesValidator()

    func testUpperRanges_shouldBeValid() {

        let result = validator.isValid(latitude: validLatitude.upperBound, longitude: validLongitude.upperBound)

        XCTAssertTrue(result)
    }

    func testLowerRanges_shouldBeValid() {

        let result = validator.isValid(latitude: validLatitude.lowerBound, longitude: validLongitude.lowerBound)

        XCTAssertTrue(result)
    }

    func testZeroValues_shouldBeValid() {

        let result = validator.isValid(latitude: 0, longitude: 0)

        XCTAssertTrue(result)
    }

    func testValidLatitudeAndInvalidLongitude_shouldBeValid() {

        let result = validator.isValid(latitude: 80, longitude: 200)

        XCTAssertFalse(result)
    }

    func testInvalidLatitudeAndValidLongitude_shouldBeValid() {

        let result = validator.isValid(latitude: 200, longitude: 100)

        XCTAssertFalse(result)
    }
}
