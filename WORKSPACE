# 加载git_repository库
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    # 该存储库包含支持基于Apple平台的构建规则的帮助程序方法。
    name = "build_bazel_apple_support",
    remote = "https://github.com/bazelbuild/apple_support.git",
    tag = "0.7.2",
)

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

git_repository(
    # 作用编译swift代码
    name = "build_bazel_rules_swift",
    remote = "https://github.com/bazelbuild/rules_swift.git",
    tag = "0.13.0",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
protobuf_deps()















git_repository(
    # 作用是帮你编译苹果设备的软件
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    tag = "0.19.0",
)

git_repository(
    # 作用是帮你管理你的源文件
    name = "bazel_skylib",
    remote = "https://github.com/bazelbuild/bazel-skylib.git",
    tag = "1.0.2",
)

load('@bazel_tools//tools/build_defs/repo:git.bzl', 'new_git_repository')


new_git_repository(
    name = "iglistkit",
    remote = "https://github.com/bilibili/IGListKit.git",
    tag = "ra4.0.0--bl0.0.1--20200511--001",
    build_file_content = """

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
package(default_visibility = ["//visibility:public"])

objc_library(
    name = "IGListDiffKit",
    srcs = glob([
        "Source/IGListDiffKit/**/*.m",
        "Source/IGListDiffKit/**/*.mm",
        "Source/IGListDiffKit/Internal/*.h"
    ]),
    hdrs = glob(["Source/IGListDiffKit/*.h"],["Source/IGListDiffKit/Internal/*.h"]),
    includes = ["Source", "Source/IGListDiffKit", "Source/IGListDiffKit/Internal"],
    module_name = "IGListDiffKit",
)

objc_library(
    name = "IGListKit",
    srcs = glob([
        "Source/IGListKit/*.m",
        "Source/IGListKit/*.mm",
        "Source/IGListKit/Internal/*.m",
        "Source/IGListKit/Internal/*.mm",
        "Source/IGListKit/Internal/*.h"
    ]),
    hdrs = glob(["Source/IGListKit/*.h"],["Source/IGListKit/Internal/*.h"]),
    includes = ["Source", "Source/IGListKit", "Source/IGListKit/Internal"],
    deps = [":IGListDiffKit"],
    sdk_frameworks = ["CoreGraphics", "QuartzCore"],
    module_name = "IGListKit",
)


""",
)