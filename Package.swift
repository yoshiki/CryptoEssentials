import PackageDescription

let package = Package(
    name: "CryptoEssentials",
    dependencies: [
        .Package(url: "https://github.com/open-swift/C7.git", majorVersion: 0, minor: 4)
    ]
)
