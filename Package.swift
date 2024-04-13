// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "HealthKitExtensions",
    platforms: [.macOS(.v13), .iOS(.v15), .watchOS(.v9)],
    products: [
        .library(
            name: "HealthKitExtensions",
            targets: ["HealthKitExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "HealthKitExtensions"),
        .testTarget(
            name: "HealthKitExtensionsTests",
            dependencies: ["HealthKitExtensions"]),
    ]
)
