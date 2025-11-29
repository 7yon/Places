//
//  PlacesListRobot.swift
//  PlacesUITests
//
//  Created by Daria Simenkova on 28.11.25.
//

import Foundation
import XCTest

class PlacesListRobot {
    private var listView = XCUIApplication().collectionViews.matching(identifier: "PlacesListView_list").firstMatch
    private var customLocationButtoon = XCUIApplication().buttons.matching(identifier: "PlacesListView_customLocationButton").firstMatch
    private var firstLocationRow = XCUIApplication().otherElements.matching(identifier: "LocationRowView").firstMatch
    
    @discardableResult
    func assertPlacesList() -> Self {
        XCTAssertTrue(listView.waitForExistence(timeout: 3.0))
        return self
    }
    
    func assertFirstLocation() -> Self {
        XCTAssertTrue(firstLocationRow.waitForExistence(timeout: 3.0))
        XCTAssertTrue(firstLocationRow.children(matching: .button)
            .matching(identifier: "LocationRowView_name").firstMatch.waitForExistence(timeout: 3.0))
        XCTAssertTrue(firstLocationRow.children(matching: .button)
            .matching(identifier: "LocationRowView_latitude").firstMatch.waitForExistence(timeout: 3.0))
        XCTAssertTrue(firstLocationRow.children(matching: .button)
            .matching(identifier: "LocationRowView_longitude").firstMatch.waitForExistence(timeout: 3.0))
        
        return self
    }
    
    @discardableResult
    func assertCustomLocationButtonIsVisible() -> Self {
        XCTAssertTrue(customLocationButtoon.waitForExistence(timeout: 3.0))
        return self
    }
    
    func selectCustomCoordinatesButton() -> CustomLocationRobot {
        customLocationButtoon.tap()
        
        return CustomLocationRobot()
    }
}
