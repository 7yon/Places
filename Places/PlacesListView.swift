//
//  PlacesListView.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import SwiftUI

struct PlacesListView: View {
    let places: [Location]

    var body: some View {
        NavigationStack {
            List(places) { location in
                NavigationLink(value: location) {
                    LocationRow(location: location)
                }
                .accessibilityHint("Double-top to open in Wikipedia")
            }
//            .navigationDestination(for: Location.self) { location in
//
//            }
            .navigationTitle("Places")
        }
    }
}

#Preview {
    PlacesListView(places: [.amsterdam, .newYork, .unknown])
}
