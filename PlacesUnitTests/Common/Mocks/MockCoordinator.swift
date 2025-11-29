//
//  MockCoordinator.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
@testable import Places

class MockCoordinator: Coordinator {
    private(set) var routes: [Places.Route] = []
    private(set) var deeplinks: [Places.Deeplink] = []
    
    private let deeplinkResult: Bool
    
    init(deeplinkResult: Bool) {
        self.deeplinkResult = deeplinkResult
    }
    
    func route(to route: Places.Route) {
        routes.append(route)
    }
    
    func route(to deeplink: Places.Deeplink) async -> Bool {
        deeplinks.append(deeplink)
        
        return deeplinkResult
    }
}
