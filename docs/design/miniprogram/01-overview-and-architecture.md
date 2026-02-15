# 喵星说明书小程序端详细设计方案（唯一实施版）

> 日期：2026-02-14  
> 范围：仅小程序前端（`src/miniprogram`），后端接口全部 Mock

## 1. 目标与完成定义

本方案只采用一条实现路径：**以 `cat.pen` 为单一视觉真源，完整实现 18 个页面与核心闭环交互，所有业务数据由本地 Mock 提供并可持久化**。

完成定义（DoD）：

1. 18 个视觉页面全部可访问，并且样式结构与文案尽量贴合 `cat.pen`。
2. 核心流程闭环：
   - AI 喵相学：上传 → 扫描中 → 诊断单 → CBTI
   - CBTI：20 题作答 → 生成过渡 → 说明书
   - 听力统考：播放声音 → 记录反应 → 雷达图结果
   - 爪速挑战：准备页 → 倒计时/挑战 → 结果分享
   - 双猫匹配：结果页 → 邀请页 → 海报页
   - 排行榜：手速榜/颜值榜切换
3. 不依赖后端，全部功能可在离线/本地环境跑通。
4. 使用 `weapp-dev` 完成至少一轮自动化自测。

## 2. 技术边界与约束

- 代码根目录：`src/miniprogram/miniprogram`
- 严禁改动：`src/backend/**`
- 构建形态：微信小程序原生（TypeScript + WXML + WXSS）
- 无 npm 运行时依赖新增，避免额外工程复杂度
- 文件长度控制：单文件尽量 ≤ 200 行

## 3. 前端架构

### 3.1 目录规划

```text
src/miniprogram/miniprogram/
├── app.json
├── app.ts
├── app.wxss
├── components/
│   └── tab-bar/
├── mock/
│   ├── types.ts
│   ├── home.ts
│   ├── cbti.ts
│   └── ...
├── utils/
│   ├── routes.ts
│   ├── navigation.ts
│   ├── storage.ts
│   ├── share.ts
│   └── haptics.ts
└── pages/
    ├── home/
    ├── ai-face/
    ├── ai-scanning/
    ├── ai-diagnosis/
    ├── cbti-test/
    ├── manual-generating/
    ├── manual/
    ├── hearing-test/
    ├── hearing-radar/
    ├── paw-ready/
    ├── paw-challenge/
    ├── match/
    ├── match-invite/
    ├── share-poster/
    ├── archive/
    ├── rank-speed/
    ├── rank-beauty/
    └── me/
```

### 3.2 数据层（Mock First）

- `mock/*.ts` 提供静态数据：
  - 首页猫历、功能入口
  - CBTI 题库（20题）
  - 排行榜（手速/颜值）
  - 档案与说明书结果
  - 双猫匹配信息、听力测试结果、分享海报内容
- `utils/storage.ts` 提供可持久状态：
  - CBTI 作答进度
  - 最近一次爪速挑战结果
  - 最近一次听力测试反应记录
  - 用户昵称与偏好

### 3.3 路由与导航策略

- 所有路由常量统一定义在 `utils/routes.ts`。
- 普通跳转使用 `wx.navigateTo`。
- 底部四大 Tab（首页/档案/排行/我的）采用自定义 `tab-bar` 组件，点击后使用 `wx.reLaunch`，确保栈稳定。
- 需要回退时统一 `wx.navigateBack`，失败则回到首页。

### 3.4 UI 还原策略

- 色板、圆角、阴影、按钮高亮统一收敛到 `app.wxss` Token。
- 明暗两套页面风格：
  - 浅色（主页、档案、排行、我的、功能页）
  - 深色（说明书、扫描中、生成中、挑战页、海报）
- 组件复用：TabBar、卡片、主/次按钮、分段 Tab、结果卡。

### 3.5 关键交互实现

- Haptic：点击答案、游戏击中、主按钮触发轻震动（`wx.vibrateShort`）。
- 扫描与生成：定时器驱动进度条，完成后自动跳转。
- CBTI：单选题流转 + 进度条 + 完成提交。
- 爪速挑战：倒计时、随机目标、点击计数、结算卡。
- 听力统考：声音条目点击、反应选择弹层、结果标签计算。

## 4. 质量保障

1. 代码规范：小文件、低耦合、工具函数集中。
2. 交互保障：每个主流程至少一条成功路径可跑通。
3. 可观测性：关键动作写入本地存储并在控制台打印。
4. 验证机制：`weapp-dev` 自动化巡检 + 手工视觉核对关键页。

## 5. 交付产物

- 小程序端完整代码（`src/miniprogram/miniprogram/**`）
- 设计/研发文档（`docs/design/miniprogram/**`）
- 变更日志（`CHANGELOG.md` 头部插入）
