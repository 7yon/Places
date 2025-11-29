//
//  AccesibilityAuditTests.swift
//  PlacesUITests
//
//  Created by Daria Simenkova on 29.11.25.
//

import XCTest

final class AccesibilityAuditTests: XCTestCase {

    @MainActor
    func testPlaces() throws {
        let app = XCUIApplication()
        app.launch()
        
        try PlacesListRobot()
            .assertPlacesList()
            .performAccessibilityAudit()
        
    }
    
    func testCustomLocation() throws {
        let app = XCUIApplication()
        app.launch()
        
        try PlacesListRobot()
            .assertPlacesList()
            .selectCustomCoordinatesButton()
            .performAccessibilityAudit()
            
    }
}
