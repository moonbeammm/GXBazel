package(default_visibility = ["//visibility:public"])

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "home_library",
    srcs = glob(["**/*.swift"]),
    deps = [
        "@iglistkit//:IGListKit",
        #"@rxswift//:RxCocoa",
    ],
)
