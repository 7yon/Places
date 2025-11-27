//
//  RootComponent.swift
//  Places
//
//  Created by Daria Simenkova on 27.11.25.
//

import Foundation
import NeedleFoundation

nonisolated class RootComponent: BootstrapComponent {

    @MainActor
    public var urlOpener: any URLOpener {
        SystemURLOpener()
    }

    var listComponent: ListComponent {
        ListComponent(parent: self)
    }
}
