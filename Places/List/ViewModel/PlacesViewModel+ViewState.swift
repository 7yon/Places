//
//  PlacesViewModel+ViewState.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
import PlacesCore

extension PlacesViewModel {
    enum ViewState {
        case idle
        case loading
        case loaded(locations: [Location])
        case error(message: LocalizedStringResource)

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
}
