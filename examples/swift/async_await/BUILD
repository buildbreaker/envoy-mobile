load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:xcodeproj.bzl", "xcodeproj")

licenses(["notice"])  # Apache 2

swift_library(
    name = "appmain",
    srcs = glob(["*.swift"]),
    linkopts = ["-lNetwork"],
    deps = ["//library/swift:ios_lib"],
)

ios_application(
    name = "app",
    bundle_id = "io.envoyproxy.envoymobile.asyncawait",
    families = ["iphone"],
    infoplists = ["Info.plist"],
    minimum_os_version = "15.0",
    deps = ["appmain"],
)

xcodeproj(
    name = "xcodeproj",
    project_name = "App",
    tags = ["manual"],
    targets = ["app"],
)
