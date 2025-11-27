//
//  PlacesSnapshotTests.swift
//  PlacesSnapshotTests
//
//  Created by Daria Simenkova on 27.11.25.
//

import SwiftUI
import XCTest
import SnapshotTesting
@testable import Places

final class LocationRowSnapshotTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        
//         SnapshotTesting.isRecording = true
    }
    

    func testDefaultLocation() {
        let view = LocationRowView(location: .amsterdam, onSelect: { _ in })
            .fixedSize(horizontal: true, vertical: true)
        
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits, traits: .init(userInterfaceStyle: .dark)))
    }
    
    func testUnknownLocation() {
        let view = LocationRowView(location: .unknown, onSelect: { _ in })
            .fixedSize(horizontal: true, vertical: true)
        
        assertSnapshot(of: view, as: .image(layout: .sizeThatFits))
    }
}
