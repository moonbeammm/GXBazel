load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")

objc_library(
    name = "universal_lib",
    srcs = [
        "universal/main.m",
        "universal/AppDelegate.m",
        "universal/ViewController.m",
    ],
    hdrs = [
        "universal/AppDelegate.h",
        "universal/ViewController.h",
    ],
    # deps = BUSINESS_LIB + GFC_LIB +SDKS,
    # sdk_dylibs = ["xml2", "resolv", "z", "bz2"],
    # resources = glob(["universal/launch*.png"]),
    enable_modules = 1,
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

#BUSINESS_LIB = [
#    "your business lib path."
#]

#GFC_LIB = [
#    "your foundation core lib path."
#]

#SDKS = [
#    "other frameworks path"
#]
