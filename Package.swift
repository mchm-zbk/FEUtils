// swift-tools-version: 6.2

import PackageDescription

let package = Package(
 name: "FEUtils",
 platforms: [
  .iOS(.v26)
 ],
 products: [
  .library(
   name: "FEUtils",
   targets: ["FEUtils"]
  ),
 ],
 targets: [
  .target(
   name: "FEUtils"
  ),
  .testTarget(
   name: "FEUtilsTests",
   dependencies: ["FEUtils"]
  ),
 ]
)
