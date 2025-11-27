//
//  MockURLOpener.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
@testable import Places

class MockURLOpener: URLOpener {
    let result: Bool
    private(set) var openedURLs: [URL] = []

    init(result: Bool = true) {
        self.result = result
    }

    func open(_ url: URL) async -> Bool {
        openedURLs.append(url)
        return result
    }
}
