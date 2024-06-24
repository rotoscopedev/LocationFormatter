// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LocationFormatter",
    platforms: [.iOS(.v12), .macOS(.v10_15)],
    products: [
        .library(
            name: "LocationFormatter",
            targets: ["LocationFormatter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wtw-software/UTMConversion", from: "1.4.0"),
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "LocationFormatter",
            dependencies: [.product(name: "UTMConversion", package: "UTMConversion")],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "LocationFormatterTests",
            dependencies: [
                "LocationFormatter",
                .product(name: "Numerics", package: "swift-numerics"),
            ]
        ),
    ]
)
