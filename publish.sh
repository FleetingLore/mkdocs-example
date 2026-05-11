#!/usr/bin/env bash

set -e

# 此处默认值应替换
REPO_NAME="mkdocs-example"
REPO="git@github.com:FleetingLore/${REPO_NAME}.git"

DEPLOY_BRANCH="gh-pages"

echo "=========================================="
echo "Deploying MkDocs project: $REPO_NAME"
echo "=========================================="

BUILD_TMP=$(mktemp -d)
cleanup() { rm -rf "$BUILD_TMP"; }
trap cleanup EXIT

# 构建 MkDocs
echo ">>> Building MkDocs project"
mkdocs build --site-dir "$BUILD_TMP"

# 添加 .nojekyll 文件
touch "$BUILD_TMP/.nojekyll"

# 直接推送到 main 分支触发 Actions
echo ">>> Pushing to main branch to trigger GitHub Actions"
git add .
git commit -m "Update content at $(date -u '+%Y-%m-%d %H:%M:%S UTC')" || echo "No changes to commit"
git push origin main

echo "done."
