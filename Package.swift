
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
    	.binaryTarget(name: "libssl", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.2/libssl.zip", checksum: "cd16172f63bc4cc3719cda078ad7b62596c8a4748cc54215382973d53efd9b8e"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.2/libcrypto.zip", checksum: "7891b1c7cd2bc796b2ada2e7980853d3c7ff0c57b8cebaa73c6bc5dc458341f3"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.2/libpython311.zip", checksum: "4018b8106d7f7e88a9ba252cde1f7a3771538fa478e423d3d535d9db4609766b"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.2/libffi.zip", checksum: "cb15e074253143df8176c9bcba95989e6d50626e741aec4ebaf3bfd4abe3cd2f"), 
    ]
)