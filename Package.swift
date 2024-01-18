// swift-tools-version: 5.5
/*
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import PackageDescription

let package = Package(
  name: "GoogleRidesharingDriver", platforms: [.iOS(.v14)],
  products: [.library(name: "GoogleRidesharingDriver", targets: ["GoogleRidesharingDriverTarget"])],
  dependencies: [
    .package(url: "https://github.com/googlemaps/ios-navigation-sdk", .exact("5.3.1")),
  ],
  targets: [
    .binaryTarget(
      name: "GoogleRidesharingDriver",
      url: "https://github.com/dogahe/DogaheDriver/releases/download/1.0.4/GoogleRidesharingDriver_3p.xcframework.zip",
      checksum: "3deeb5c007b50f4d4b0b8b9e39320a13c0e1f2a3d71bd5118286a02e98e815b4"
    ),
    .target(
      name: "GoogleRidesharingDriverTarget",
      dependencies: ["GoogleRidesharingDriver",
                     .product(name: "GoogleNavigation", package: "ios-navigation-sdk"),
      ],
      path: "Driver",
      sources: ["GMTDEmpty.m"],
      resources: [.copy("Resources/GoogleRidesharingDriver/GoogleRidesharingDriver.bundle")],
      publicHeadersPath: "Sources"
    ),
  ]
)
