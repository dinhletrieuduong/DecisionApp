import ProjectDescription

let targetScripts = [

    TargetScript.pre(path: "Scripts/SwiftLintRunScript.sh", arguments: [], name: "SwiftLint")
]

let project = Project(
    name: "DecisionApp",
    packages: [
        .package(url: "https://github.com/realm/SwiftLint.git", .upToNextMajor(from: "0.55.1")),
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.9.1")),
    ],
    targets: [
        .target(
            name: "DecisionApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.DecisionApp",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["DecisionApp/Sources/**"],
            resources: ["DecisionApp/Resources/**"],
            scripts: targetScripts,
            dependencies: [
                .package(product: "SwiftLint", type: .plugin),
                .package(product: "Alamofire", type: .plugin),
//                .external(name: "Alamofire"), // packageSettings
            ]
        ),
        .target(
            name: "DecisionAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.DecisionAppTests",
            infoPlist: .default,
            sources: ["DecisionApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "DecisionApp")]
        ),
    ],
    schemes: [
        Scheme.scheme(name: "Debug", shared: true,
                      buildAction: BuildAction.buildAction(targets: ["DecisionApp"]),
                      testAction: TestAction.targets(["DecisionApp"]),
                      runAction: RunAction.runAction(configuration: "Debug", executable: "App", arguments: nil)
                     ),
        Scheme.scheme(name: "Release", shared: true,
                      buildAction: BuildAction.buildAction(targets: ["DecisionApp"]),
                      testAction: TestAction.targets(["DecisionApp"]),
                      runAction: RunAction.runAction(configuration: "Release", executable: "App", arguments: nil)
                     )
    ]
)
