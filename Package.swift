// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CedroAuthentication",
    platforms: [
        .iOS(.v14),
        .macOS(.v12),
        .macCatalyst(.v15),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "CedroAuthentication",
            targets: ["CedroAuthentication"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rafaelesantos/refds-core.git", branch: "main")
    ],
    targets: [
        .target(
            name: "CedroAuthentication",
            dependencies: [
                "CedroAuthenticationDomain",
                "CedroAuthenticationData",
                "CedroAuthenticationPresentation",
                "CedroAuthenticationInfra"
            ]),
        .target(
            name: "CedroAuthenticationDomain",
            dependencies: [.product(name: "RefdsCore", package: "refds-core")]),
        .target(
            name: "CedroAuthenticationData",
            dependencies: [
                "CedroAuthenticationDomain",
                .product(name: "RefdsCore", package: "refds-core")]),
        .target(
            name: "CedroAuthenticationInfra",
            dependencies: [.product(name: "RefdsCore", package: "refds-core")]),
        .target(
            name: "CedroAuthenticationPresentation",
            dependencies: [
                "CedroAuthenticationDomain",
                .product(name: "RefdsCore", package: "refds-core")])
    ]
)
