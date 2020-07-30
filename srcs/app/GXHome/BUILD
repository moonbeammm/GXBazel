package(default_visibility = ["//visibility:public"])

objc_library(
    name = "gxhome_library",
    srcs = glob([
        "GXHome/**/*.m",
        "GXHome/**/*.h",
    ]),
    hdrs = glob(["include/GXHome/*.h"]),
    copts = [
        "-iquote srcs/app/GXHome/GXHome",
        "-iquote srcs/app/GXHome/include/GXHome",
    ],
    deps = [
        "@iglistkit//:IGListKit",
    ],
    includes = ["include"],
)
