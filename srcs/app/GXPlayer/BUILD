package(default_visibility = ["//visibility:public"])

objc_library(
    name = "gxplayer_library",
    srcs = glob([
        "GXPlayer/**/*.m",
        "GXPlayer/**/*.h",
    ]),
    hdrs = glob(["include/GXPlayer/*.h"]),
    copts = [
        "-iquote srcs/app/GXPlayer/GXPlayer",
        "-iquote srcs/app/GXPlayer/include/GXPlayer",
    ],
    deps = [
        "//srcs/common/GXKVO:gxkvo_library",
        "@iglistkit//:IGListKit",
    ],
    includes = ["include"],
)
