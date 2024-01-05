
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
    	.binaryTarget(name: "libssl", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.4/libssl.zip", checksum: "a55962f7dd951cb704c87a9ce5d5c75285e26f4ceedb2c438c405e1e882a7c21"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.4/libcrypto.zip", checksum: "f395b06ad4367ab69c9392992b2fc278cb188cb2b151bcafc4573bfa15abfe57"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.4/libpython311.zip", checksum: "cc6112007158f3f0737f25906f04721eb8b09417c64d4aa277143ecfc6e34073"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.4/libffi.zip", checksum: "72071c2f978bf5a61d571d8d2c46c6dcbd3bf2daa4fe7e19ece8fec03eada43c"), 
    ]
)