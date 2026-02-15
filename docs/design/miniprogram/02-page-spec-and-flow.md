# 页面实现清单与流程闭环

## 1. 页面对照表（cat.pen → 小程序路由）

| 序号 | 视觉稿页面 | Node ID | 路由 | 页面角色 |
|---|---|---|---|---|
| 1 | 首页 | 1G9SU | `pages/home/index` | Tab-首页 |
| 2 | AI喵相学 | fJGOd | `pages/ai-face/index` | 子页 |
| 3 | CBTI测试 | YRxjL | `pages/cbti-test/index` | 子页 |
| 4 | 喵星说明书 | Y7JLF | `pages/manual/index` | 结果页 |
| 5 | 喵语听力统考 | JLmUU | `pages/hearing-test/index` | 子页 |
| 6 | 爪速大挑战 | rMJKb | `pages/paw-challenge/index` | 游戏页 |
| 7 | 双猫匹配 | WU1ri | `pages/match/index` | 子页 |
| 8 | 档案 | pQpW8 | `pages/archive/index` | Tab-档案 |
| 9 | 排行-手速榜 | TCSKf | `pages/rank-speed/index` | Tab-排行 |
| 10 | 我的 | 216UK | `pages/me/index` | Tab-我的 |
| 11 | 颜值榜 | bC5Df | `pages/rank-beauty/index` | 子页（排行子态） |
| 12 | 听觉雷达图结果 | rAdarX | `pages/hearing-radar/index` | 结果页 |
| 13 | AI喵相诊断单 | fTK0X | `pages/ai-diagnosis/index` | 结果页 |
| 14 | 分享海报 | iK4hc | `pages/share-poster/index` | 结果页 |
| 15 | AI扫描中 | BLSPV | `pages/ai-scanning/index` | 过渡页 |
| 16 | 说明书生成中 | oiGx9 | `pages/manual-generating/index` | 过渡页 |
| 17 | 双猫匹配-邀请 | e0hPU | `pages/match-invite/index` | 子页 |
| 18 | 爪速挑战-准备 | FtBq7 | `pages/paw-ready/index` | 子页 |

## 2. 关键流程闭环

### 2.1 AI喵相学闭环

`首页` → `AI喵相学` → `AI扫描中` → `AI喵相诊断单` → `CBTI测试` → `说明书生成中` → `喵星说明书` → `分享海报`

### 2.2 听力测试闭环

`首页` → `喵语听力统考`（声音测试+反应记录） → `听觉雷达图结果` → `分享海报`

### 2.3 爪速挑战闭环

`首页` → `爪速挑战-准备` → `爪速大挑战`（倒计时+目标点击） → `分享海报`

### 2.4 双猫匹配闭环

`首页` → `双猫匹配` → `双猫匹配-邀请` → `分享海报`

### 2.5 排行与档案闭环

`首页` ↔ `档案` ↔ `排行（手速）` ↔ `我的`（底部 Tab 互通）  
`排行（手速）` ↔ `颜值榜`（顶部分段切换）

## 3. 页面状态定义

### 3.1 通用状态

- `loading`: 过渡页进度动画
- `ready`: 页面可交互
- `error`: mock 异常提示（Toast）

### 3.2 业务状态

- AI：`idle` / `uploaded` / `scanning` / `diagnosed`
- CBTI：`answering` / `completed`
- Hearing：`category_selected` / `reaction_recorded` / `result_ready`
- APM：`countdown` / `running` / `finished`
- Match：`result_showing` / `inviting`

## 4. 交互规范落地

1. 主按钮：44px 高度（视觉等效），圆角大于 16rpx，珊瑚橙渐变。
2. 次按钮：白底描边，弱阴影。
3. 深色卡片：`#151821` ～ `#20232d` 渐变；浅色卡片：`#FFFFFF`。
4. 反馈：关键点击触发轻震动；长耗时动作展示进度条。
5. 分享：所有结果页均支持“跳转海报页 + onShareAppMessage”。
