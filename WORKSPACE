# 加载git_repository库
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    # 该存储库包含支持基于Apple平台的构建规则的帮助程序方法。
    name = "build_bazel_apple_support",
    remote = "https://github.com/bazelbuild/apple_support.git",
    tag = "0.7.2",
)

git_repository(
    # 作用编译swift代码
    name = "build_bazel_rules_swift",
    remote = "https://github.com/bazelbuild/rules_swift.git",
    tag = "0.13.0",
)

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
