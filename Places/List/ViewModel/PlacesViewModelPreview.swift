//
//  PlacesViewModelPreview.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation

class PlacesViewModelPreview: PlacesViewModelProtocol {
    var state: PlacesViewModel.ViewState = .idle
    var activeAlert: LocalizedStringResource = ""

    init(state: PlacesViewModel.ViewState) {
        self.state = state
    }

    func loadPlaces() async { }

    func didSelect(location: Location) async { }

    func didSelectCustomLocation() { }

    func didCloseAlert() { }
}
