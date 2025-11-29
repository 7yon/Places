// swift-tools-version: 5.9
import PackageDescription
let package = Package(
    name: "PlacesNetworking",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PlacesNetworking",
            targets: ["PlacesNetworking"]
        )
    ],
    dependencies: [
        .package(path: "../PlacesCore")
    ],
    targets: [
        .target(
            name: "PlacesNetworking",
            dependencies: ["PlacesCore"]
        ),
        .testTarget(
            name: "PlacesNetworkingTests",
            dependencies: ["PlacesNetworking"]
        )
    ]
)
