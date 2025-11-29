// swift-tools-version: 5.9
import PackageDescription
let package = Package(
    name: "PlacesCore",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PlacesCore",
            targets: ["PlacesCore"]
        )
    ],
    targets: [
        .target(
            name: "PlacesCore",
            dependencies: []
        ),
        .testTarget(
            name: "PlacesCoreTests",
            dependencies: ["PlacesCore"]
        )
    ]
)
