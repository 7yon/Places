//
//  PlacesUnitTests.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 27.11.25.
//

import XCTest
@testable import Places

@MainActor
final class PlacesViewModelTests: XCTestCase {
    var viewModel: PlacesViewModel!

    override func tearDown() {
        super.tearDown()

        viewModel = nil
    }

    func testWhenCreated_thenStateIdle() {
        let repository = MockPlacesRepository()
        let coordinator = PlacesCoordinator(urlOpener: MockURLOpener())
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)
        guard case .idle = viewModel.state else {
            return XCTFail("Expected state to be .idle, got \(viewModel.state)")
        }
    }

    func testWhenLoadingIsTriggered_andSuccessResult_thenLoadedState() async {
        let repository = MockPlacesRepository()
        let coordinator = PlacesCoordinator(urlOpener: MockURLOpener())
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
        let coordinator = PlacesCoordinator(urlOpener: MockURLOpener())
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
        let urlOpener = MockURLOpener()
        let coordinator = PlacesCoordinator(urlOpener: urlOpener)
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)

        await viewModel.didSelect(location: .amsterdam)
        await viewModel.didSelect(location: .london)

        let amsterdamDeeplink = try XCTUnwrap(URL(string: "wikipedia://places?latitude=52.3702&longitude=4.8951"))
        let londonDeeplink = try XCTUnwrap(URL(string: "wikipedia://places?latitude=51.5074&longitude=-0.1278"))

        XCTAssertEqual(urlOpener.openedURLs, [
            amsterdamDeeplink,
            londonDeeplink
        ])
    }

    func testWhenDidSelectLocation_andCoudntOpenURL_thenAlertShown() async throws {
        let repository = MockPlacesRepository()
        let urlOpener = MockURLOpener(result: false)
        let coordinator = PlacesCoordinator(urlOpener: urlOpener)
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)

        await viewModel.didSelect(location: .amsterdam)

        let amsterdamDeeplink = try XCTUnwrap(URL(string: "wikipedia://places?latitude=52.3702&longitude=4.8951"))

        XCTAssertEqual(urlOpener.openedURLs, [
            amsterdamDeeplink
        ])

        XCTAssertEqual(String(localized: viewModel.activeAlert), "Wikipedia app is not installed")
    }

    func testWhenDidCloseAlert_thenNoAlertShown() async throws {
        let repository = MockPlacesRepository()
        let urlOpener = MockURLOpener(result: false)
        let coordinator = PlacesCoordinator(urlOpener: urlOpener)
        viewModel = PlacesViewModel(repository: repository,
                                    coordinator: coordinator)

        await viewModel.didSelect(location: .amsterdam)

        XCTAssertEqual(String(localized: viewModel.activeAlert), "Wikipedia app is not installed")

        await viewModel.didCloseAlert()

        XCTAssertEqual(String(localized: viewModel.activeAlert), "")
    }
}
