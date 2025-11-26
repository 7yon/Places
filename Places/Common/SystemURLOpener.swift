//
//  SystemURLOpener.swift
//  Places
//
//  Created by Daria Simenkova on 26.11.25.
//

import Foundation
import UIKit

final class SystemURLOpener: URLOpener {
    func open(_ url: URL) async -> Bool {
        await withCheckedContinuation { continuation in
            Task { @MainActor in
                UIApplication.shared.open(url, options: [:]) { result in
                    continuation.resume(returning: result)
                }
            }
        }
    }
}
