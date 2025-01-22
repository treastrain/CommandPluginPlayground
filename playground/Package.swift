// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "playground",
    dependencies: [
        .package(url: "https://github.com/freddi-kit/ArtifactBundleGen", exact: "0.0.7"),
    ],
    targets: [
        .executableTarget(
            name: "playground"),
    ],
    swiftLanguageModes: [.v6]
)
