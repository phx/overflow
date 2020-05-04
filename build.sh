#!/bin/bash

# BUILD ON MACOS:

clang="$(xcrun --sdk iphoneos --find clang)"
sdk_path="$(xcrun --sdk iphoneos --show-sdk-path)"

make -C . CC="${clang} -isysroot ${sdk_path} -arch armv7 -arch armv7s -arch arm64"
