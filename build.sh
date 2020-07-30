#!/bin/sh
set -e

echo "通过//universal/universal.tulsi.tulsiproj文件生成universal.xcodeproj文件"
./tools/Tulsi.app/Contents/MacOS/Tulsi -- --genconfig universal/universal.tulsi.tulsiproj:universal --no-open-xcode

# 制作软链。在Xcode里可以直接查看这些远程仓库的代码
ln -sf universal/universal.xcodeproj/.tulsi/tulsi-workspace/external .
sed -i.bak "s/tulsi-workspace\/external/external/g" universal/universal.xcodeproj/project.pbxproj

open universal/universal.xcodeproj
