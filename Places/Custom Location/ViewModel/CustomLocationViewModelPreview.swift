//
//  CustomLocationViewModelPreview.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

class CustomLocationViewModelPreview: CustomLocationViewModel {
    var latitude: String = ""
    var longitude: String = ""

    var coordinatesAreValid: Bool

    init(coordinatesAreValid: Bool = true) {
        self.coordinatesAreValid = coordinatesAreValid
    }

    func coordinatesDidChange(latitude: String, longitude: String) { }
}
