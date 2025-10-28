# MT6739 Kernel 在线编译指南

## 📋 准备工作

1. 注册 GitHub 账号（如果还没有）：https://github.com/signup
2. 安装 Git（如果还没有）：https://git-scm.com/download/win

## 🚀 编译步骤

### 1. 创建 GitHub 仓库

1. 登录 GitHub
2. 点击右上角 `+` → `New repository`
3. 仓库名称填：`mt6739-kernel`
4. 选择 `Public`（公开）
5. 点击 `Create repository`

### 2. 上传代码到 GitHub

在 PowerShell 中运行：

```powershell
cd D:\kernel-4.4

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: MT6739 kernel source with ACM support"

# 添加远程仓库（替换 YOUR_USERNAME 为你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/mt6739-kernel.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 3. 触发编译

推送完成后，GitHub Actions 会自动开始编译！

你可以在这里查看编译进度：
```
https://github.com/YOUR_USERNAME/mt6739-kernel/actions
```

### 4. 下载编译好的 Kernel

编译完成后（约 20-40 分钟）：

1. 进入 `Actions` 页面
2. 点击最新的 workflow run
3. 在 `Artifacts` 部分下载 `mt6739-kernel-with-acm`
4. 解压得到 `kernel` 文件
5. 将 `kernel` 文件复制到 `D:\D22\和对讲D22刷机\boot.img.dump\`
6. 替换原来的 `kernel` 文件
7. 重新打包 `boot.img`
8. 刷入测试！

## ⚠️ 注意事项

- 如果编译失败，检查 Actions 日志查看错误信息
- 确保仓库是 Public（私有仓库有时间限制）
- 编译时间取决于 GitHub 服务器负载

## 🎯 编译配置

本配置使用：
- **defconfig**: `k39tv1_64_bsp_defconfig`
- **工具链**: Linaro GCC 7.5
- **架构**: ARM64
- **USB ACM**: 已启用（CONFIG_USB_CONFIGFS_ACM=y）

## 🔍 验证 ACM 支持

编译完成后，可以用以下命令验证：

```powershell
Select-String -Path "kernel" -Pattern "usb_f_acm|CONFIG_USB_F_ACM|f_acm"
```

如果有输出，说明 ACM 驱动已编译进 kernel！



2025年10月28日, 星期二 20:24:05

