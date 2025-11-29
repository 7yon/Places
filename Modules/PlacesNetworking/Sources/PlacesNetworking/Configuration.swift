//
//  File.swift
//  PlacesNetworking
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

public struct Configuration {
    public let baseURL: URL

    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
}
