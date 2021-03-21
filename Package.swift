// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "Sword",
  products: [
    .library(name: "Sword", targets: ["Sword"]),
  ],
  dependencies: [
    .package(url: "https://github.com/rinsuki/Starscream", .branch("support-linux-and-windows")),
  ],
  targets: [
    .target(
      name: "Sword",
      dependencies: ["Starscream"]
    ),
  ]
)
