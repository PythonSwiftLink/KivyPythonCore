
// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "KivyPythonCore", 
    platforms: [.iOS(.v13)], 
    products: [
    	.library(
        	name: "PythonCore", 
        	targets: [
        		"PythonCore", 
        	"libpython311", 
        	"libssl", 
        	"libcrypto", 
        	"libffi"
        	]
    	), 
    	.library(
        	name: "PythonLibrary", 
        	targets: [
        		"PythonLibrary"
        	]
    	), 
    ], 
    dependencies: [
    ], 
    targets: [
    	.target(
        	name: "PythonCore", 
        	dependencies: [
        		"libssl", 
        		"libcrypto", 
        		"libpython311", 
        		"libffi", 
        	], 
        	resources: [
        	], 
        	linkerSettings: [
        		.linkedLibrary("bz2"), 
        		.linkedLibrary("z"), 
        		.linkedLibrary("ncurses"), 
        		.linkedLibrary("sqlite3"), 
        	]
    	), 
    	.target(
        	name: "PythonLibrary", 
        	dependencies: [
        	], 
        	resources: [
        	.copy("lib")
        	], 
        	linkerSettings: [
        	]
    	), 
    	.binaryTarget(name: "libssl", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.3/libssl.zip", checksum: "351049b713ca26b0b6d1384ae6ad8737bd695657c74c3da877ac67d601a6c7fe"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.3/libcrypto.zip", checksum: "9883c4d905d7780bd0cebe11d9c8a2cd0f72069794d7d48ffabc1a9f71a2b778"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.3/libpython311.zip", checksum: "024cb12b7850c374f897f162434d368780322ac32112b9bae5f743eaab2839f3"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.3/libffi.zip", checksum: "adc3cb8cd7e2e56651477d827838cd01dd35ccb3f237c7e60fba3ec65c180ed2"), 
    ]
)