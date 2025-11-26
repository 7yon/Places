//
//  PlacesViewModel.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation
import Observation

protocol PlacesViewModelProtocol {
    var state: PlacesViewModel.ViewState { get }
    var activeAlert: String { get }
    func loadPlaces() async
    func didSelect(location: Location) async
    func didCloseAlert()
}

class PlacesViewModelPreview: PlacesViewModelProtocol {
    var state: PlacesViewModel.ViewState = .idle
    var activeAlert: String = ""

    init(state: PlacesViewModel.ViewState) {
        self.state = state
    }

    func loadPlaces() async { }

    func didSelect(location: Location) async { }

    func didCloseAlert() { }
}

@MainActor
@Observable
class PlacesViewModel: PlacesViewModelProtocol {
    enum ViewState {
        case idle
        case loading
        case loaded(locations: [Location])
        case error(message: String)

        var isLoading: Bool {
            switch self {
            case .loading:
                return true
            default:
                return false
            }
        }

        var locations: [Location] {
            guard case .loaded(let locations) = self else {
                return []
            }
            return locations
        }
    }

    var state: ViewState = .idle
    var activeAlert: String = ""

    private let repository: PlacesRepository
    private let coordinator: PlacesCoordinator

    init (repository: PlacesRepository, coordinator: PlacesCoordinator) {
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
            state = .error(message: "Failed to fetch places")
        }
    }

    func didSelect(location: Location) async {
        await openWikipedia(for: location)
    }

    private func openWikipedia(for location: Location) async {
        let url = URL(string: "wikipedia://places?latitude=\(location.latitude)&longitude=\(location.longitude)")!
        let result = await coordinator.openDeepLink(url)

        if !result {
            activeAlert = "Wikipedia app is not installed"
        }
    }

    func didCloseAlert() {
        activeAlert = ""
    }
}
