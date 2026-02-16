#!/bin/bash

# 创建 Xcode 项目目录
mkdir -p MeowManual.xcodeproj

# 创建 project.pbxproj 文件
cat > MeowManual.xcodeproj/project.pbxproj << 'EOF'
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {

/* Begin PBXBuildFile section */
EOF

# 添加所有 Swift 文件的引用
FILE_REFS=""
BUILD_FILES=""
FILE_LIST=""

# 递归查找所有 Swift 文件
find MeowManual -name "*.swift" -type f | sort | while read file; do
    # 生成唯一的文件引用 ID
    FILENAME=$(basename "$file" .swift)
    REF_ID=$(echo "$file" | md5 | cut -c1-24 | tr 'a-z' 'A-Z')
    
    echo "Processing: $file"
done

echo "Project structure created"
