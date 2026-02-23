import PackageDescription

let package = Package(
 name: "FEUtils",
 platforms: [
  .iOS(.v26),
  .macOS(.v26),
  .tvOS(.v26),
  .visionOS(.v26)
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
