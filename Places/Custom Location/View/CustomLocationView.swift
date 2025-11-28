//
//  CustomLocationView.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import SwiftUI
import MapKit

struct CustomLocationView: View {

    @State private var latitude: String = ""
    @State private var longitude: String = ""

    var isValid: Bool {
        validate(latitude: latitude, longitude: longitude)
    }

    var body: some View {
        Form {
            Section(header: Text(.customLocationSectionHeader),
                    footer: Text(.customLocationSectionFooter)) {

                TextField(String(localized: .customLocationInputPlaceholderLatitude), text: $latitude)
                    .textFieldStyle(CoordinateTextFieldStyle())

                TextField(String(localized: .customLocationInputPlaceholderLongitude), text: $longitude)
                    .textFieldStyle(CoordinateTextFieldStyle())
            }

            Section {
                if isValid {
                    Button {

                    } label: {
                        Text(.customLocationButtonOpenWikipedia)
                    }

                } else {
                    Text(.customLocationLabelErrorInvalidCoordinates)
                        .foregroundColor(.red)
                }
            }
        }
    }

    func validate(latitude: String, longitude: String) -> Bool {
        guard !latitude.isEmpty, !longitude.isEmpty else {
            return false
        }

        let latitude = Double(latitude) ?? 0.0
        let longitude = Double(longitude) ?? 0.0

        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return CLLocationCoordinate2DIsValid(coordinate)
    }
}

#Preview {
    CustomLocationView()
}
