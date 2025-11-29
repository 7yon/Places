//
//  PlacesListView.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import SwiftUI

struct PlacesListView: View {
    let viewModel: PlacesViewModelProtocol

    @State
    var customLocationPresented = false

    init(viewModel: PlacesViewModelProtocol) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .loaded(let locations):
                    List(locations) { location in
                        LocationRowView(location: location) { selected in
                            Task {
                                await viewModel.didSelect(location: selected)
                            }
                        }
                        .accessibilityHint(.placeItemAccessibilityHint)
                    }
                    .accessibilityIdentifier("PlacesListView_list")
                case .error(let message):
                    Text(message)
                }
            }

            .navigationTitle(.placesListTitle)
            .toolbar(content: {
                Button {
                    customLocationPresented = true
                } label: {
                    Text(.placesListToolbarButtonCustomLocation)
                }.navigationDestination(isPresented: $customLocationPresented) {
                    CustomLocationView()
                }
                .accessibilityIdentifier("PlacesListView_customLocationButton")
            })
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
        .task {
            await viewModel.loadPlaces()
        }
    }
}

#Preview {
    let state: PlacesViewModel.ViewState = .loaded(locations: [.amsterdam])
    PlacesListView(viewModel: PlacesViewModelPreview(state: state))
}
