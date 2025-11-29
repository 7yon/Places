//
//  AppEnvironment.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

enum AppEnvironment {
    struct Configuration {
        let baseURL: URL
    }

    case production

    var configuration: Configuration {
        switch self {
        case .production:
            guard let url = URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/") else {
                fatalError("Invalid URL in production env")
            }
            return Configuration(baseURL: url)
        }
    }
}
