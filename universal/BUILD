load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "universal_lib",
    srcs = [
        "universal/main.swift",
        "universal/AppDelegate.swift",
    ],
    deps = [
        "//srcs/app/GXHome:home_library",
        "//srcs/app/GXPlayer:gxplayer_library",
    ],
    # sdk_dylibs = ["xml2", "resolv", "z", "bz2"],
    # resources = glob(["universal/launch*.png"]),
)

ios_application(
    name = "universal",
    bundle_id = "com.sunxxxx.universal",
#    app_icons = glob(["universal/Assets.xcassets/AppIcon.appiconset/*.png"]) 
#              + glob(["universal/Assets.xcassets/AppIcon.appiconset/*.json"]),
#    launch_storyboard = "universal/Launch Screen.xib",
    families = [
        "iphone",
        "ipad",
    ],
    minimum_os_version = "9.0",
    infoplists = [":universal/Info.plist"],
    visibility = ["//visibility:public"],
    deps = [
        ":universal_lib"
    ],
#    provisioning_profile = select({
#        "//:ios_adhoc": ":universal_AdHoc.mobileprovision",
#        "//:ios_store": ":universal_Store.mobileprovision",
#        "//conditions:default": ":universal_Debug.mobileprovision" ,
#    }),
#    entitlements = select({
#        "//:ios_adhoc": ":universal/universal_adhoc.entitlements",
#        "//:ios_store": ":universal/universal_store.entitlements",
#        "//conditions:default": ":universal/universal_development.entitlements"
#    }),
#    extensions = ["//universal/MessageExtension:messageextension",
#                    "//universal/WidgetExtension:widgetextension",
#                    "//universal/NotificationServiceExtension:notificationextension"],
#    ipa_post_processor = select({
#        "//:ios_adhoc": "//:ios_strip_x86",
#        "//:ios_store": "//:ios_strip_x86",
#        "//conditions:default": "//:do_nothing",
#    }),
#    frameworks = ["//",],
)
