//
//  MockPlacesViewModel.swift
//  PlacesSnapshotTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
@testable import Places

class MockPlacesViewModel: PlacesViewModelProtocol {
    var state: Places.PlacesViewModel.ViewState = .idle
    
    var activeAlert: LocalizedStringResource = ""
    
    func loadPlaces() async { }
    
    func didSelect(location: Places.Location) async { }
    
    func didSelectCustomLocation() { }
    
    func didCloseAlert() { }
}
