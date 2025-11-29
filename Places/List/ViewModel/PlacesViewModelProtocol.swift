//
//  PlacesViewModelProtocol.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
import PlacesCore

protocol PlacesViewModelProtocol {
    var state: PlacesViewModel.ViewState { get }
    var activeAlert: LocalizedStringResource { get }

    func loadPlaces() async
    func didSelect(location: Location) async
    func didSelectCustomLocation()
    func didCloseAlert()
}
