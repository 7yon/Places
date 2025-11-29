//
//  CustomLocationViewModelTests.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import XCTest
import PlacesCore
@testable import Places

final class CustomLocationViewModelTests: XCTestCase {
    var coordinator: MockCoordinator!
    var viewModel: CustomLocationViewModelImpl!
    let coordinnatesValidator = WGS84CoordinatesValidator()

    override func setUp() {
        super.setUp()
        
        coordinator = MockCoordinator(deeplinkResult: false)
    }
    
    override func tearDown() {
        super.tearDown()

        viewModel = nil
        coordinator = nil
    }

    @MainActor
    func testInitialState() {
        viewModel = CustomLocationViewModelImpl(coordinatesValidator: coordinnatesValidator,
                                                coordinator: coordinator)
        XCTAssertEqual(viewModel.latitude, "")
        XCTAssertEqual(viewModel.longitude, "")
        XCTAssertEqual(viewModel.activeAlert, "")
        XCTAssertEqual(viewModel.coordinatesAreValid, false)
    }
    
    @MainActor
    func testErrorWhenCoordinatesAreNotValid() {
        viewModel = CustomLocationViewModelImpl(coordinatesValidator: coordinnatesValidator,
                                                coordinator: coordinator)
        viewModel.latitude = "12,,0"
        viewModel.longitude = "3000"
        XCTAssertEqual(viewModel.coordinatesAreValid, false)
    }
    
    @MainActor
    func testValidCoordinates_andNoWikipediaApp_shouldShowAlert() async {
        viewModel = CustomLocationViewModelImpl(coordinatesValidator: coordinnatesValidator,
                                                coordinator: coordinator)
        viewModel.latitude = "55,7558"
        viewModel.longitude = "37,6173"
        XCTAssertEqual(viewModel.coordinatesAreValid, true)
        
        await viewModel.didSelectOpenInWikipedia()
        
        XCTAssertEqual(String(localized: viewModel.activeAlert), "Wikipedia app is not installed")
        
        viewModel.didCloseAlert()
        
        XCTAssertEqual(viewModel.activeAlert, "")
    }
    
    @MainActor
    func testValidCoordinates_andWikipediaApp_shouldOpenDeeplink() async {
        coordinator = MockCoordinator(deeplinkResult: true)
        viewModel = CustomLocationViewModelImpl(coordinatesValidator: coordinnatesValidator,
                                                coordinator: coordinator)
        viewModel.latitude = "55,7558"
        viewModel.longitude = "37,6173"
        XCTAssertEqual(viewModel.coordinatesAreValid, true)
        
        await viewModel.didSelectOpenInWikipedia()

        XCTAssertEqual(coordinator.deeplinks, [
            .wikipedia(latitude: 55.7558, longitude: 37.6173)
        ])
    }
}
