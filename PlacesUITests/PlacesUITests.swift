//
//  PlacesUITests.swift
//  PlacesUITests
//
//  Created by Daria Simenkova on 28.11.25.
//

import XCTest

final class PlacesUITests: XCTestCase {

    @MainActor
    func testPlaces() {
        let app = XCUIApplication()
        app.launch()
        
        PlacesListRobot()
            .assertPlacesList()
            .assertFirstLocation()
            .assertCustomLocationButtonIsVisible()
    }
    
    func testCustomLocation() {
        let app = XCUIApplication()
        app.launch()
        
        PlacesListRobot()
            .assertPlacesList()
            .selectCustomCoordinatesButton()
            .enter(latitude: "0,0")
            .enter(longitude: "0,0")
            .assertWikipediaButtonVisible()
            .clearLatitude()
            .enter(latitude: "1000")
            .assertInvalidCoordinatesErrorLabelVisible()
    }
}
