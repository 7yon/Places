//
//  AppCoordinatorTests.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import XCTest
import SwiftUI
import PlacesCore
@testable import Places

final class AppCoordinatorTests: XCTestCase {
    
    func testPlacesListRoute() {
        let coordinator = AppCoordinator(viewResolver: MockCoordinatorViewResolver(),
                                         urlOpener: MockURLOpener())
        
        XCTAssertTrue(coordinator.path.isEmpty)
        
        coordinator.route(to: .placesList)
        
        XCTAssertFalse(coordinator.path.isEmpty)
    }
    
    func testCustomLocationRoute() {
        let coordinator = AppCoordinator(viewResolver: MockCoordinatorViewResolver(),
                                         urlOpener: MockURLOpener())
        
        XCTAssertTrue(coordinator.path.isEmpty)
        
        coordinator.route(to: .customLocation)
        
        XCTAssertFalse(coordinator.path.isEmpty)
    }
    
    func testWikipediaDeeplink() async throws {
        let urlOpener = MockURLOpener()
        let coordinator = AppCoordinator(viewResolver: MockCoordinatorViewResolver(),
                                         urlOpener: urlOpener)
        
        XCTAssertTrue(coordinator.path.isEmpty)
        
        try await coordinator.route(to: Deeplink.wikipedia(latitude: 12.0, longitude: 10.2))
        
        XCTAssertTrue(coordinator.path.isEmpty)
        
        let expectedURL = try XCTUnwrap(URL(string: "wikipedia://places?latitude=12.0&longitude=10.2"))
        
        XCTAssertEqual(urlOpener.openedURLs, [expectedURL])
    }
}
