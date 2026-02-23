import PackageDescription

let package = Package(
 name: "FEUtils",
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
