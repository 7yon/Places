//
//  PlacesUITests.swift
//  PlacesUITests
//
//  Created by Daria Simenkova on 28.11.25.
//

import XCTest

final class PlacesUITests: XCTestCase {

    @MainActor
    func testPlaces() throws {
        let app = XCUIApplication()
        app.launch()
        
        PlacesListRobot()
            .assertPlacesList()
            .assertFirstLocation()
            .assertCustomLocationButtonIsVisible()
    }
}
