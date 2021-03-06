// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "client-example",
    platforms: [
       .macOS(.v10_15),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.4"),
         .package(url: "https://github.com/apple/swift-nio.git", from: "2.15.0"),
         .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0-alpha.8"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "client-example",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "NIO", package: "swift-nio"),
            ]),
        .testTarget(
            name: "client-exampleTests",
            dependencies: ["client-example"]),
    ]
)
