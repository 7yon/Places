//
//  MockCoordinator.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import PlacesCore

class MockCoordinator: Coordinator {
    private(set) var routes: [Route] = []
    private(set) var deeplinks: [Deeplink] = []
    
    private let deeplinkResult: Bool
    
    init(deeplinkResult: Bool) {
        self.deeplinkResult = deeplinkResult
    }
    
    func route(to route: Route) {
        routes.append(route)
    }
    
    func route(to deeplink: Deeplink) async -> Bool {
        deeplinks.append(deeplink)
        
        return deeplinkResult
    }
}
