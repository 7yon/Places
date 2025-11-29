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

    var activeAlert: LocalizedStringResource { get }

    func didSelectOpenInWikipedia() async

    func didCloseAlert()
}
