// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SocialAuthSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SocialAuthSDK",
            targets: ["SocialAuthSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/GoogleSignIn-iOS.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "SocialAuthSDK",
            dependencies: [
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")
            ],
            path: "Sources"),
        .testTarget(
            name: "SocialAuthSDKTests",
            dependencies: ["SocialAuthSDK"],
            path: "Tests/SocialAuthSDKTests"
        ),
        
    ]
)
