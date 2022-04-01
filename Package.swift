// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Niagara",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Niagara",
            targets: ["Niagara"]
        )
    ],
    targets: [
        .target(
            name: "Niagara",
            dependencies: []
        ),
        .testTarget(
            name: "NiagaraTests",
            dependencies: ["Niagara"]
        )
    ]
)
