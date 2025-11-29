//
//  URLOpener.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation

protocol URLOpener {
    func open(_ url: URL) async -> Bool
}
