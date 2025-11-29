//
//  MockCoordinatorViewResolver.swift
//  PlacesUnitTests
//
//  Created by Daria Simenkova on 29.11.25.
//

import Foundation
import SwiftUI
@testable import Places

struct MockCoordinatorViewResolver: CoordinatorViewResolver {
    var listView: AnyView = AnyView(Text("List View"))
    
    var customLocationView: AnyView = AnyView(Text("Custom Location View"))
}
