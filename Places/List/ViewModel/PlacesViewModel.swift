//
//  PlacesViewModel.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation
import Observation

@MainActor
@Observable
class PlacesViewModel: PlacesViewModelProtocol {
    var state: ViewState = .idle
    var activeAlert: LocalizedStringResource = ""

    private let repository: PlacesRepository
    private let coordinator: Coordinator

    init(repository: PlacesRepository, coordinator: Coordinator) {
        self.repository = repository
        self.coordinator = coordinator
    }

    func loadPlaces() async {
        state = .loading

        do {
            let locations = try await repository.fetchPlaces()
                .locations.map { dto in
                    Location(name: dto.name, latitude: dto.latitude, longitude: dto.longitude)
                }
            state = .loaded(locations: locations)
        } catch {
            state = .error(message: .placesListLabelFetchError)
        }
    }

    func didSelect(location: Location) async {
        await openWikipedia(for: location)
    }

    func didSelectCustomLocation() {
        coordinator.route(to: .customLocation)
    }

    private func openWikipedia(for location: Location) async {
        let result = await coordinator.route(to: .wikipedia(latitude: location.latitude,
                                                            longitude: location.longitude))

        if !result {
            activeAlert = .placesListAlertNoWikipedia
        }
    }

    func didCloseAlert() {
        activeAlert = ""
    }
}
