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
        await MainActor.run {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                return true
            } else {
                return false
            }
        }
    }
}
