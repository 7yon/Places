//
//  PlacesUnitTests.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 27.11.25.
//

import XCTest
import PlacesCore
@testable import Places

@MainActor
final class PlacesViewModelTests: XCTestCase {
    var coordinator: MockCoordinator!
    var viewModel: PlacesViewModel!

    override func setUp() {
        super.setUp()
        
        coordinator = MockCoordinator(deeplinkResult: true)
    }
    
    override func tearDown() {
        super.tearDown()

        viewModel = nil
        coordinator = nil
    }

    func testWhenCreated_thenStateIdle() {
        let repository = MockPlacesRepository()
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)
        guard case .idle = viewModel.state else {
            return XCTFail("Expected state to be .idle, got \(viewModel.state)")
        }
    }

    func testWhenLoadingIsTriggered_andSuccessResult_thenLoadedState() async {
        let repository = MockPlacesRepository()
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)

        await viewModel.loadPlaces()

        guard case .loaded(let locations) = viewModel.state else {
            return XCTFail("Expected state to be .idle, got \(viewModel.state)")
        }

        XCTAssertEqual(locations.count, 3)
    }

    func testWhenLoadingIsTriggered_andNetworkError_thenErrorState() async {
        let repository = MockPlacesRepository(error: URLError(.badServerResponse))
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)

        await viewModel.loadPlaces()

        guard case .error(let message) = viewModel.state else {
            return XCTFail("Expected state to be .error, got \(viewModel.state)")
        }

        XCTAssertEqual(String(localized: message), "Failed to fetch places")
    }

    func testWhenDidSelectLocation_thenOpenURLIsCalled() async throws {
        let repository = MockPlacesRepository()
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)

        await viewModel.didSelect(location: .amsterdam)
        await viewModel.didSelect(location: .london)

        XCTAssertEqual(coordinator.deeplinks, [
            .wikipedia(latitude: 52.3702, longitude: 4.8951),
            .wikipedia(latitude: 51.5074, longitude: -0.1278),
        ])
    }

    func testWhenDidSelectLocation_andCoudntOpenURL_thenAlertShown() async throws {
        let repository = MockPlacesRepository()
        coordinator = MockCoordinator(deeplinkResult: false)
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)

        await viewModel.didSelect(location: .amsterdam)

        XCTAssertEqual(coordinator.deeplinks, [
            .wikipedia(latitude: 52.3702, longitude: 4.8951)
        ])

        XCTAssertEqual(String(localized: viewModel.activeAlert), "Wikipedia app is not installed")
    }

    func testWhenDidCloseAlert_thenNoAlertShown() async throws {
        let repository = MockPlacesRepository()
        coordinator = MockCoordinator(deeplinkResult: false)
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)

        await viewModel.didSelect(location: .amsterdam)

        XCTAssertEqual(String(localized: viewModel.activeAlert), "Wikipedia app is not installed")

        viewModel.didCloseAlert()

        XCTAssertEqual(String(localized: viewModel.activeAlert), "")
    }
}
