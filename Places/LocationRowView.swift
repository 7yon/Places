//
//  LocationRow.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import SwiftUI

struct LocationRowView: View {

    let location: Location

    let onSelect: (Location) -> Void

    var body: some View {
        let name = location.name ?? String(localized: LocalizedStringResource.placeItemLabelUnknownLocation)

        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
            Text(.placeItemLabelLatitude(location.latitude))
            Text(.placeItemLabelLongitude(location.longitude))
        }
        .onTapGesture {
            onSelect(location)
        }
        .accessibilityAddTraits(.isButton)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(name)
        .accessibilityValue(.placeItemAccessibilityValue(location.latitude, location.longitude))
    }
}

#Preview {
    Group {
        LocationRowView(location: .amsterdam) { _ in }

        LocationRowView(location: .unknown) { _ in }
    }
}
