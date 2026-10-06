// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "survey_utils",
  platforms: [
    .iOS("12.0")
  ],
  products: [
    .library(name: "survey-utils", targets: ["survey_utils"])
  ],
  dependencies: [
    .package(name: "FlutterFramework", path: "../FlutterFramework")
  ],
  targets: [
    .target(
      name: "survey_utils",
      dependencies: [
        .product(name: "FlutterFramework", package: "FlutterFramework")
      ]
    )
  ]
)
