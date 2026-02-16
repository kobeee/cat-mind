# 喵星说明书 iOS App

> SwiftUI + iOS 17+ 实现

## 项目结构

```
src/ios/MeowManual/
├── App/
│   └── MeowManualApp.swift          # App 入口与主 Tab 导航
├── Core/
│   ├── DesignSystem/
│   │   ├── Colors.swift             # 设计系统颜色
│   │   ├── Typography.swift         # 字体规范
│   │   ├── Spacing.swift            # 间距系统
│   │   └── Components/
│   │       ├── MMButton.swift       # 主按钮组件
│   │       ├── MMNavigationBar.swift # 导航栏组件
│   │       └── MMProgressBar.swift  # 进度条组件
│   ├── Models/
│   │   ├── CatProfile.swift         # 猫咪档案模型
│   │   ├── CBTIQuestion.swift       # CBTI 题目模型
│   │   └── TestResult.swift         # 测试结果模型
│   └── Services/
│       └── MockDataService.swift    # Mock 数据层
└── Features/
    ├── Home/
    │   └── HomeView.swift           # 首页（含每日猫历、功能网格）
    ├── Archive/
    │   └── ArchiveView.swift        # 档案页
    ├── Rank/
    │   ├── RankSpeedView.swift      # 手速榜
    │   └── RankBeautyView.swift     # 颜值榜
    ├── Profile/
    │   └── ProfileView.swift        # 我的
    ├── AIFace/
    │   └── AIFaceView.swift         # AI喵相学
    └── CBTI/
        └── CBTITestView.swift       # CBTI测试
```

## 技术栈

- **SwiftUI** - 声明式 UI 框架
- **iOS 17+** - 最低支持版本
- **SwiftData** - 数据持久化
- **SF Symbols** - 图标系统

## 设计系统

### 颜色
- 品牌色: `#FF7A50` (珊瑚橙)
- 背景色: `#FAF9F7` (奶油色)
- 深色背景: `#0D0D0F` (工业风)

### 字体
- 标题: 22-42px, 600-800 weight
- 正文: 15-17px, 400-500 weight
- 辅助: 11-14px, 400-600 weight

## 功能模块

### 已实现页面

1. ✅ **首页** - 每日猫历、功能入口网格
2. ✅ **档案** - 猫咪档案、测试记录
3. ✅ **排行** - 手速榜、颜值榜
4. ✅ **我的** - 用户设置
5. ✅ **AI喵相学** - 面相分析入口
6. ✅ **CBTI测试** - 性格测试答题

### 核心流程

- 首页 → 功能选择 → 测试 → 结果
- Tab 导航: 首页 / 档案 / 排行 / 我的

## 如何运行

1. 打开 Xcode 15+
2. 选择 "Open Existing Project"
3. 导航到 `src/ios/` 目录
4. 创建一个新的 iOS App 项目，选择 SwiftUI 模板
5. 将 `MeowManual` 文件夹中的所有 Swift 文件添加到项目中
6. 运行 (Cmd+R)

## 后续开发

待实现页面:
- AI扫描中动画
- AI喵相诊断单
- 说明书生成中
- 喵星说明书结果
- 喵语听力统考
- 听觉雷达图结果
- 爪速挑战准备/游戏/结果
- 双猫匹配/邀请/分享海报

## 注意事项

- 所有数据为本地 Mock，无后端依赖
- 使用 SwiftData 持久化用户档案
- 单文件控制在 200 行以内
- 严格遵循视觉稿配色和布局
