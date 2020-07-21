#!/bin/sh
set -e

echo "通过//universal/universal.tulsi.tulsiproj文件生成universal.xcodeproj文件"
./tools/Tulsi.app/Contents/MacOS/Tulsi -- --genconfig universal/universal.tulsi.tulsiproj:universal --no-open-xcode

open universal/universal.xcodeproj