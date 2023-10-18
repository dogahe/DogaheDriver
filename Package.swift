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
  dependencies: [],
  targets: [
    .binaryTarget(
      name: "GoogleRidesharingDriver",
      url: "https://github.com/dogahe/DogaheDriver/releases/download/1.0.0/GoogleRidesharingDriver_3p.xcframework.zip",
      checksum: "fee1a91065a7c0a6110c68d33a638c5d92ac1a900f180a9e27aec777376fa169"
    ),
    .target(
      name: "GoogleRidesharingDriverTarget",
      dependencies: ["GoogleRidesharingDriver"],
      path: "Driver",
      sources: ["dummy.m"],
      resources: [.copy("Resources/GoogleRidesharingDriver/GoogleRidesharingDriver.bundle")],
      publicHeadersPath: "Sources"
    ),
  ]
)
