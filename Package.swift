
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
    	.binaryTarget(name: "libssl", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.3/libssl.zip", checksum: "82d3f08840413b00fc04368c37cbef7ebc35b008305ca160c5a0e5d4be9c31f5"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.3/libcrypto.zip", checksum: "c97a9fea6db28344c1db947a919bcb4cc590674c73376441767131c1a60ca944"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.3/libpython311.zip", checksum: "718b7b8c1f245ab470f98ca9bb6dfd70ce619aa5eb0ab0489e0a55aea269a43f"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.3/libffi.zip", checksum: "8b32bb6b6aab44f422e40b3320fbff2650d2e4dee6a2fa26c5a6e6646396659b"), 
    ]
)