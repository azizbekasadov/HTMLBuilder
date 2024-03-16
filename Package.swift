// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HTMLBuilder",
    platforms: [.iOS(.v15), .macOS(.v10_13), .watchOS(.v7), .tvOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HTMLBuilder",
            targets: ["HTMLBuilder"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HTMLBuilder"),
        .testTarget(
            name: "HTMLBuilderTests",
            dependencies: ["HTMLBuilder"]),
    ]
)
