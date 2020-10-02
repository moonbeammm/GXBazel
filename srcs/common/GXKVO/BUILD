package(default_visibility = ["//visibility:public"])

objc_library(
    name = "gxkvo_library",
    srcs = glob([
        "GXKVO/**/*.m",
        "GXKVO/**/*.h",
    ]),
    hdrs = glob(["include/GXKVO/*.h"]),
    copts = [
        "-iquote srcs/common/GXKVO/GXKVO",
        "-iquote srcs/common/GXKVO/include/GXKVO",
    ],
    includes = ["include"],
)
