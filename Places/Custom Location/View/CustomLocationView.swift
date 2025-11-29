//
//  CustomLocationView.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import SwiftUI
import MapKit

struct CustomLocationView: View {
    @State var viewModel: CustomLocationViewModel

    init(viewModel: CustomLocationViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Form {
            Section(header: Text(.customLocationSectionHeader),
                    footer: Text(.customLocationSectionFooter)) {

                TextField(String(localized: .customLocationInputPlaceholderLatitude), text: $viewModel.latitude)
                    .textFieldStyle(CoordinateTextFieldStyle())

                TextField(String(localized: .customLocationInputPlaceholderLongitude), text: $viewModel.longitude)
                    .textFieldStyle(CoordinateTextFieldStyle())
            }

            Section {
                if viewModel.coordinatesAreValid {
                    Button {
                        Task {
                            await viewModel.didSelectOpenInWikipedia()
                        }
                    } label: {
                        Text(.customLocationButtonOpenWikipedia)
                    }

                } else {
                    Text(.customLocationLabelErrorInvalidCoordinates)
                        .foregroundColor(.red)
                }
            }
        }
        .alert(viewModel.activeAlert, isPresented: Binding(
            get: { !String(localized: viewModel.activeAlert).isEmpty },
            set: { isPresented in
                if !isPresented { viewModel.didCloseAlert() }
            }
        )) {
            Button(.commonAlertLabelOk, role: .cancel) {
                viewModel.didCloseAlert()
            }
        }
    }
}

#Preview {
    let viewModel = CustomLocationViewModelPreview(coordinatesAreValid: true)
    CustomLocationView(viewModel: viewModel)
}
