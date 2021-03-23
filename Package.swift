// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RemoteStoreMappable",
    platforms: [.macOS(.v10_12),
                .iOS(.v11),
                .tvOS(.v10),
                .watchOS(.v3)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RemoteStoreMappable",
            targets: ["RemoteStoreMappable"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "ObjectMapper", url: "https://github.com/tristanhimmelman/ObjectMapper.git", from: "4.2.0"),
            .package(url: "https://github.com/dsay/RemoteStoreAlamofire", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RemoteStoreMappable",
            dependencies: ["RemoteStoreAlamofire", "ObjectMapper"]),
        .testTarget(
            name: "RemoteStoreMappableTests",
            dependencies: ["RemoteStoreMappable"]),
    ]
)
