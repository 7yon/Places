//
//  PlacesListViewSnapshotTests.swift
//  PlacesSnapshotTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import SwiftUI
import XCTest
import SnapshotTesting
@testable import Places

final class PlacesListViewSnapshotTests: XCTestCase {

    override class func setUp() {
        super.setUp()
        
//         SnapshotTesting.isRecording = true
    }

    func testLoadedState() {
        let viewModel = MockPlacesViewModel()
        viewModel.state = .loaded(locations: [.amsterdam, .london, .unknown])
        let view = PlacesListView(viewModel: viewModel)
        
        assertSnapshot(of: view, as: .image(layout: .device(config: .iPhone13)))
        assertSnapshot(of: view, as: .image(layout: .device(config: .iPhone13), traits: .init(userInterfaceStyle: .dark)))
    }
    
    func testLoadingState() {
        let viewModel = MockPlacesViewModel()
        viewModel.state = .loading
        let view = PlacesListView(viewModel: viewModel)
        
        assertSnapshot(of: view, as: .image(layout: .device(config: .iPhone13)))
    }
    
    func testErrorStateView() {
        let viewModel = MockPlacesViewModel()
        viewModel.state = .error(message: "Error occured")
        let view = PlacesListView(viewModel: viewModel)
        
        assertSnapshot(of: view, as: .image(layout: .device(config: .iPhone13)))
    }
}
