// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "Sword",
  products: [
    .library(name: "Sword", targets: ["Sword"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/daltoniam/Starscream.git",
      .upToNextMajor(from: "4.0.0")
    )
  ],
  targets: [
    .target(
      name: "Sword",
      dependencies: ["Starscream"]
    )
  ]
)
