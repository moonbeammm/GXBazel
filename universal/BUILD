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
        "//srcs/common/GXCNavigationController:gxcnavigationcontroller_library",
        "//srcs/common/GXCTabBarController:gxctabbarcontroller_library",
    ],
    # sdk_dylibs = ["xml2", "resolv", "z", "bz2"],
    # resources = glob(["universal/launch*.png"]),
)

ios_application(
    name = "universal",
    bundle_id = "com.sunxxxx.universal",
    app_icons = glob(["universal/Assets.xcassets/AppIcon.appiconset/*.png"])
              + glob(["universal/Assets.xcassets/AppIcon.appiconset/*.json"]),
    launch_storyboard = "universal/Launch Screen.xib",
    families = ["iphone", "ipad"],
    minimum_os_version = "9.0",
    infoplists = [":universal/Info.plist"],
    visibility = ["//visibility:public"],
    deps = [
        ":universal_lib"
    ],
    provisioning_profile = "//universal:App_custom.mobileprovision",
    #provisioning_profile = select({
     #   "//:ios_dev": ":App_custom.mobileprovision",
      #  "//:ios_adhoc": ":App_custom.mobileprovision",
       # "//:ios_store": ":App_custom.mobileprovision",
        #"//:ios_enter": ":App_custom.mobileprovision",
        #"//:ios_custom": ":App_custom.mobileprovision",
        #"//conditions:default": ":App_custom.mobileprovision",
   # }),
    #entitlements = select({
     #   "//:ios_adhoc": ":universal/App_custom.entitlements",
      #  "//:ios_store": ":universal/App_custom.entitlements",
       # "//conditions:default": ":universal/App_custom.entitlements"
    #}),
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
