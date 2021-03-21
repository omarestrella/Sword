// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "Sword",
  products: [
    .library(name: "Sword", targets: ["Sword"]),
  ],
  dependencies: [
    .package(url: "https://github.com/omarestrella/Starscream.git", .branch("support-linux")),
  ],
  targets: [
    .target(
      name: "Sword",
      dependencies: ["Starscream"]
    ),
  ]
)
