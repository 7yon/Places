//
//  MockCustomLocationViewModel.swift
//  PlacesSnapshotTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
@testable import Places

class MockCustomLocationViewModel: CustomLocationViewModel {
    var latitude: String = ""
    
    var longitude: String = ""
    
    var coordinatesAreValid: Bool = false
    
    var activeAlert: LocalizedStringResource = .init(stringLiteral: "")
    
    func didSelectOpenInWikipedia() async { }
    
    func didCloseAlert() { }
}
