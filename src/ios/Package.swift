// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MeowManual",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .executable(
            name: "MeowManual",
            targets: ["MeowManual"]),
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "MeowManual",
            dependencies: [],
            path: "MeowManual",
            exclude: [],
            swiftSettings: [
                .enableExperimentalFeature("SwiftUI")
            ]
        ),
    ]
)
