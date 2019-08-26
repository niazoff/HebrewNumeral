// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "HebrewNumeral",
  products: [
    .library(
      name: "HebrewNumeral",
      targets: ["HebrewNumeral"]),
  ],
  targets: [
    .target(
      name: "HebrewNumeral"),
    .testTarget(
      name: "HebrewNumeralTests",
      dependencies: ["HebrewNumeral"]),
  ]
)
