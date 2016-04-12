import PackageDescription

let package = Package(
    name: "CryptoEssentials",
    dependencies: [
        .Package(url: "https://github.com/open-swift/c7.git", majorVersion: 0, minor: 4)
    ]
)
