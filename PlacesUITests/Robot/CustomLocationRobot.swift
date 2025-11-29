//
//  CustomLocationRobot.swift
//  PlacesUITests
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import XCTest

class CustomLocationRobot {
    private var latitudeTextField = XCUIApplication().textFields.matching(identifier: "CustomLocationView_latitudeTextField").firstMatch
    private var longitudeTextField = XCUIApplication().textFields.matching(identifier: "CustomLocationView_longitudeTextField").firstMatch
    
    private var openWikipediaButton = XCUIApplication().buttons.matching(identifier: "CustomLocationView_openWikipediaButton").firstMatch
    private var invalidCoordinatesErrorLabel = XCUIApplication().staticTexts.matching(identifier: "CustomLocationView_invariantCoordinatesErrorLabel").firstMatch

    func enter(latitude: String) -> Self {
        latitudeTextField.tap()
        latitudeTextField.typeText(latitude)
        
        return self
    }
    
    func enter(longitude: String) -> Self {
        longitudeTextField.tap()
        longitudeTextField.typeText(longitude)
        
        return self
    }
    
    func clearLatitude() -> Self {
        latitudeTextField.tap()
        latitudeTextField.clear()
        
        return self
    }
    
    func clearLongitude() -> Self {
        longitudeTextField.tap()
        longitudeTextField.clear()
        
        return self
    }
    
    func assertWikipediaButtonVisible() -> Self {
        XCTAssertTrue(openWikipediaButton.waitForExistence(timeout: 3))
        return self
    }
    
    func assertInvalidCoordinatesErrorLabelVisible() -> Self {
        XCTAssertTrue(invalidCoordinatesErrorLabel.waitForExistence(timeout: 3))
        return self
    }
    
    func performAccessibilityAudit() throws {
        let ignored = ["CustomLocationView_sectionHeader",
                       "CustomLocationView_sectionFooter",
                       "CustomLocationView_coordinatesSection",
                       "CustomLocationView_invariantCoordinatesErrorLabel"]
        
        try XCUIApplication().performAccessibilityAudit() { issue in
            
            guard let element = issue.element else { return false }
            
            if issue.auditType == .elementDetection || issue.auditType == .contrast,
                ignored.firstIndex(of: element.identifier) != nil {
                return true
            } else {
                return false
            }
        }
    }
}

fileprivate extension XCUIElement {
    func clear() {
        tap()
        let count = (value as? String)?.count ?? 0
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: count)
        typeText(deleteString)
    }
}
