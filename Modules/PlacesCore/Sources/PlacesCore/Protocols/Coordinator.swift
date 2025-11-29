//
//  Coordinator.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

public protocol Coordinator {
    func route(to route: Route)
    func route(to deeplink: Deeplink) async -> Bool
}
