//
//  LocationRow.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import SwiftUI

struct LocationRow: View {

    let location: Location

    let onSelect: (Location) -> Void

    var body: some View {
        let name = location.name ?? "Unknown location"

        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
            Text("Latitude: \(location.latitude)")
            Text("Longitude: \(location.longitude)")
        }
        .onTapGesture {
            onSelect(location)
        }
        .accessibilityAddTraits(.isButton)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(name)
        .accessibilityValue("Latitude \(location.latitude), Longitude \(location.longitude)")
    }
}

#Preview {
    Group {
        LocationRow(location: .amsterdam) { _ in }

        LocationRow(location: .unknown) { _ in }
    }
}
