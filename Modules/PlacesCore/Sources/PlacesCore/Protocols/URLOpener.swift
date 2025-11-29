//
//  URLOpener.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

public protocol URLOpener {
    func open(_ url: URL) async -> Bool
}
