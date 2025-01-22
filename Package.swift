// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "CommandPluginPlayground",
    products: [
        .plugin(
            name: "CommandPluginPlayground",
            targets: ["CommandPluginPlayground"]),
    ],
    targets: [
        .binaryTarget(
            name: "playground",
            path: "playground/playground.artifactbundle"
        ),
        .plugin(
            name: "CommandPluginPlayground",
            capability: .command(intent: .custom(
                verb: "playground",
                description: "prints hello world"
            )),
            dependencies: [
                "playground"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
