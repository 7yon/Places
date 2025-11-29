//
//  CustomLocationSnapshotTests.swift
//  PlacesSnapshotTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import SwiftUI
import XCTest
import SnapshotTesting
@testable import Places

final class CustomLocationSnapshotTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        
//         SnapshotTesting.isRecording = true
    }
    

    func testDefaultState() {
        let viewModel = MockCustomLocationViewModel()
        let view = CustomLocationView(viewModel: viewModel)
        
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits, traits: .init(userInterfaceStyle: .dark)))
    }
    
    func testErrorState() {
        let viewModel = MockCustomLocationViewModel()
        viewModel.latitude = "300,0"
        viewModel.longitude = "90"
        let view = CustomLocationView(viewModel: viewModel)
        
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits, traits: .init(userInterfaceStyle: .dark)))
    }
    
    func testValidState() {
        let viewModel = MockCustomLocationViewModel()
        viewModel.latitude = "90,0"
        viewModel.longitude = "180"
        viewModel.coordinatesAreValid = true
        let view = CustomLocationView(viewModel: viewModel)
        
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits, traits: .init(userInterfaceStyle: .dark)))
    }
}
