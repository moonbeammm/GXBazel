load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")

objc_library(
    name = "universal_lib",
    srcs = glob(
	["universal/*.m"],
    )+glob(
	["universal/*.h"],
    ), 
    hdrs = [
    	"universal/AppDelegate.h",
    ],
)

ios_application(
    name = "universal",
    bundle_id = "com.sunxxxx.universal",
    families = [
        "iphone",
        "ipad",
    ],
    minimum_os_version = "9.0",
    infoplists = [":universal/Info.plist"],
    visibility = ["//visibility:public"],
    deps = [":universal_lib"],
)

