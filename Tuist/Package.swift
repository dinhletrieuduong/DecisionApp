// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
         productTypes: [
            :
//            "Alamofire": .framework,
         ]
    )
#endif

let package = Package(
    name: "DecisionApp",
    products: [
        .library(name: "Framework", targets: ["DecisionApp"]),
    ],
    dependencies: [
        // Add your own dependencies here:
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.55.1"),
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.9.1"),
    ],
    targets: [
        .target(
            name: "DecisionApp",
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLint"),
                .plugin(name: "Alamofire", package: "Alamofire"),
            ]
        ),
    ]
)
