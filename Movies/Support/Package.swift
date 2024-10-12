//
//  Package.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation
import PackageDescription

let package = Package(
    name: "Movies",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.2")
    ],
    targets: [
        .target(
            name: "YourProjectName",
            dependencies: ["Alamofire"]),
    ]
)
