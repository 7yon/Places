//
//  PlacesListView.swift
//  Places
//
//  Created by Daria Simenkova on 25.11.25.
//

import SwiftUI

struct PlacesListView: View {
    let viewModel: PlacesViewModelProtocol

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
                        LocationRow(location: location) { selected in
                            Task {
                                await viewModel.didSelect(location: selected)
                            }
                        }
                        .accessibilityHint("Double-tap to open in Wikipedia")
                    }
                case .error(let message):
                    Text(message)
                }
            }

            .navigationTitle("Places")
            .alert(viewModel.activeAlert, isPresented: Binding(
                get: { !viewModel.activeAlert.isEmpty },
                set: { isPresented in
                    if !isPresented { viewModel.didCloseAlert() }
                }
            )) {
                Button("OK", role: .cancel) {
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
