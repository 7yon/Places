//
//  PlacesCoordinator.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

class PlacesCoordinator {
    private let urlOpener: URLOpener

    init(urlOpener: URLOpener) {
        self.urlOpener = urlOpener
    }

    func openDeepLink(_ url: URL) async -> Bool {
        return await urlOpener.open(url)
    }
}
