#!/bin/bash

# BUILD ON MACOS:

clang="$(xcrun --sdk iphoneos --find clang)"
sdk_path="$(xcrun --sdk iphoneos --show-sdk-path)"

if [[ -z $1 ]]; then
  make -C . CC="${clang} -isysroot ${sdk_path} -arch armv7 -arch armv7s -arch arm64 -mios-version-min=5.0"
  # make -C . CC="${clang} -isysroot ${sdk_path} -arch arm64 -mios-version-min=5.0"
elif [[ $1 = 'llvm' ]]; then
  make llvm -C . CC="${clang} -isysroot ${sdk_path} -arch arm64 -mios-version-min=5.0"
fi
