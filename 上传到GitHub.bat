@echo off
chcp 65001 >nul
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 🚀 上传 kernel-4.4 到 GitHub
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

echo 📋 请先在 GitHub 创建仓库！
echo.
echo 步骤：
echo 1. 访问 https://github.com/new
echo 2. 仓库名称填：mt6739-kernel
echo 3. 选择 Public（公开）
echo 4. 点击 Create repository
echo.
set /p username="请输入你的 GitHub 用户名: "

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 📦 初始化 Git 仓库...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
git init

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 📝 添加文件...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
git add .

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 💾 提交...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
git commit -m "Initial commit: MT6739 kernel source with ACM support"

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 🔗 添加远程仓库...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
git remote add origin https://github.com/%username%/mt6739-kernel.git

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 🚀 推送到 GitHub...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
git branch -M main
git push -u origin main

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ✅ 上传完成！
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo 📊 查看编译进度：
echo https://github.com/%username%/mt6739-kernel/actions
echo.
echo 等待 20-40 分钟后下载编译好的 kernel！
echo.
pause

