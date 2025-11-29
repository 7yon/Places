//
//  CustomLocationViewModel.swift
//  Places
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation

protocol CustomLocationViewModel {
    var latitude: String { get set }
    var longitude: String { get set }

    var coordinatesAreValid: Bool { get }

    func coordinatesDidChange(latitude: String, longitude: String)
}
