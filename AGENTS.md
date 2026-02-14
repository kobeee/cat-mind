# AGENTS.md - 喵星说明书项目指南

> 微信小程序原型设计项目 | 使用 Pencil MCP 创建 UI 设计

---

## 1. 项目概述

**项目名称**: 喵星说明书 (Meow Manual)  
**类型**: 微信小程序产品原型设计  
**核心工具**: Pencil MCP (Model Context Protocol)  

**项目结构**:
```
cat-mind/
├── cat.pen                   # Pencil 设计文件（18个页面 + 1个组件）
├── src/                      # 项目源码目录
├── docs/
│   ├── prd/v1.0.md           # 产品需求文档
│   ├── design/
│   │   ├── design-guidelines.md    # 设计指引
│   │   └── ui/                     # UI设计文档
│   │       ├── prd-gap-analysis.md     # PRD差距分析
│   │       ├── user-flows.md           # 用户流程图
│   │       ├── design-system.md        # 设计系统规范
│   │       └── interaction-specs.md    # 交互标注文档
│   └── rules/                # 设计规范文档
├── CHANGELOG.md              # 变更记录
├── CLAUDE.md                 # Claude Code 项目指南
└── IFLOW.md                  # iFlow 项目指南
```

**已设计页面 (18个)**:

| # | 页面名称 | 节点ID | 类型 | 位置x |
|---|---------|--------|------|-------|
| 1 | 首页 | 1G9SU | Tab页 | 0 |
| 2 | AI喵相学 | fJGOd | 子页面 | 502 |
| 3 | CBTI测试 | YRxjL | 子页面 | 1004 |
| 4 | 喵星说明书 | Y7JLF | 子页面 | 1506 |
| 5 | 喵语听力统考 | JLmUU | 子页面 | 2008 |
| 6 | 爪速大挑战 | rMJKb | 子页面 | 2510 |
| 7 | 双猫匹配 | WU1ri | 子页面 | 3012 |
| 8 | 档案 | pQpW8 | Tab页 | 3514 |
| 9 | 排行-手速榜 | TCSKf | Tab页 | 4016 |
| 10 | 我的 | 216UK | Tab页 | 4518 |
| 11 | 颜值榜 | bC5Df | 子页面 | 5020 |
| 12 | 听觉雷达图结果 | rAdarX | 子页面 | 5522 |
| 13 | AI喵相诊断单 | fTK0X | 子页面 | 6024 |
| 14 | 分享海报 | iK4hc | 子页面 | 6526 |
| 15 | AI扫描中 | BLSPV | 子页面 | 7028 |
| 16 | 说明书生成中 | oiGx9 | 过渡页 | 7530 |
| 17 | 双猫匹配-邀请 | e0hPU | 子页面 | 8032 |
| 18 | 爪速挑战-准备 | FtBq7 | 子页面 | 8534 |

**可复用组件**: Icon/Home (g8iri, x=-200)

---

## 2. Pencil MCP 核心命令

```javascript
// 打开/创建设计文件
mcp_pencil_open_document({ filePathOrTemplate: "cat.pen" })

// 设置设计变量
mcp_pencil_set_variables({
  filePath: "cat.pen",
  variables: { "primary": "#07C160", "spacing-md": 12 }
})

// 批量设计操作
mcp_pencil_batch_design({ filePath: "cat.pen", operations: "..." })

// 获取截图验证
mcp_pencil_get_screenshot({ filePath: "cat.pen", nodeId: "..." })
```

---

## 3. 设计变量规范

**颜色** (WeUI 标准):
```
primary: #07C160 (微信绿)
accent: #FF6B35 (活力橙)
danger: #FA5151 (警告红)
text-primary: #000000
text-secondary: #666666
bg-page: #F5F5F5
bg-card: #FFFFFF
```

**间距** (4px 网格):
```
space-sm: 8px
space-md: 12px
space-lg: 16px
space-xl: 24px
```

**圆角**:
```
radius-md: 8px (按钮)
radius-lg: 12px (卡片)
radius-xl: 16px (大卡片)
```

---

## 4. 微信小程序设计标准

**屏幕尺寸**:
- 标准宽度: 750rpx
- 页面边距: 16px
- TabBar 高度: 100rpx

**字体层级**:
| 层级 | 大小 | 字重 | 用途 |
|------|------|------|------|
| 大标题 | 20px | 600 | 页面标题 |
| 标题 | 18px | 600 | 区块标题 |
| 正文 | 16px | 400 | 主要文字 |
| 辅助 | 14px | 400 | 描述说明 |

**组件规范**:
- **按钮**: 高度 44px，圆角 8px，主按钮 #07C160
- **卡片**: 背景 #FFFFFF，圆角 12-16px，内边距 16px
- **图标**: 使用 Material Symbols Rounded，标准 24px

---

## 5. 设计工作流程

### 5.1 设计新页面

1. **规划位置**: 横向排列，间距 100px
   ```javascript
   const x = pageIndex * 502; // 页面位置
   ```

2. **创建页面框架**:
   ```javascript
   page = I(document, {
     type: "frame",
     name: "页面名称",
     x: x, y: 0,
     width: 402, height: 874,
     fill: "$bg-page",
     clip: true,
     layout: "vertical"
   })
   ```

3. **构建组件**: 使用 `pencil_batch_design` 批量创建

4. **验证**: 使用 `get_screenshot` 检查效果

### 5.2 修改现有设计

1. 使用 `pencil_batch_get` 获取现有节点
2. 使用 `pencil_batch_design` 的 `U()` 更新属性
3. 验证修改效果

---

## 6. 设计原则

**视觉稿第一原则** (最高优先级):
- **完整呈现原则**: 视觉稿原型必须清晰呈现产品的所有具象形态，是产品形态的完整表达
- **多Tab独立页面**: 当一个页面有多个Tab时，若每个Tab内容不同，在视觉稿中应为独立页面
  - 固定元素（如TabBar）保持一致
  - Tab显示为对应激活状态  
  - 内容区域展示该Tab特有的内容
- **滚动内容完整展示**: 若页面支持上下滑动，视觉稿应展示完整的长条内容（而非固定高度的裁剪视图）
  - 不担心页面过长
  - 核心目标是完整表达产品形态

**视觉原则**:
- **多巴胺科技风**: 高饱和度暖色 + 深灰背景
- **工业风档案**: 深色背景 + 橙色强调（说明书页面）
- **iOS 风格**: 大圆角、柔和阴影、留白

**布局原则**:
- **横向排列**: 所有页面在画布上横向排列
- **统一间距**: 页面间距 100px
- **Flexbox 布局**: 使用 vertical/horizontal 布局
- **16px 边距**: 标准页面内边距

---

## 7. 常见任务代码片段

### 7.1 添加新页面

```javascript
// 使用 find_empty_space_on_canvas 找到空位
// 当前最后一个页面在 x=8534，下一个页面约在 x=9036
newPage = I(document, {
  type: "frame",
  name: "新页面名称",
  x: 9036, y: 0,
  width: 402, height: 874,
  fill: "$bg-cream",
  clip: true,
  layout: "vertical"
})
```

### 7.2 创建可复用组件

```javascript
button = I(document, {
  type: "frame",
  name: "Button/Primary",
  reusable: true,
  height: 44,
  fill: "$primary",
  cornerRadius: 8
})

btnInstance = I(parent, {
  type: "ref",
  ref: "buttonId"
})
```

### 7.3 更新颜色主题

```javascript
mcp_pencil_replace_all_matching_properties({
  filePath: "cat.pen",
  parents: ["pageId"],
  properties: {
    fillColor: [{ from: "#FF6B35", to: "#07C160" }]
  }
})
```

---

## 8. 命名规范

- **页面**: 中文名称（如"AI喵相学"）
- **组件**: PascalCase（如"PrimaryButton"）
- **变量**: lowercase-with-dashes（如"bg-card"）

---

## 9. 参考资源

- **WeUI 官方**: https://weui.io/
- **微信小程序设计指南**: https://developers.weixin.qq.com/miniprogram/design/
- **本地规范**: `docs/rules/wechat-miniprogram-complete-guide.md`

---

## 10. 注意事项

- ⚠️ **无构建系统**: 这是设计原型项目，不需要 npm/build
- ⚠️ **无测试**: 设计文件不需要单元测试
- ✅ **版本控制**: cat.pen 文件应提交到 git
- ✅ **截图验证**: 重要修改后使用 get_screenshot 验证
- ✅ **技能优先**: 使用已安装的 pencil-ui-design 技能
- ✅ **变更记录**: 所有变更必须记录到 CHANGELOG.md，详见第13节

---

## 11. 设计规范文档

**UI设计文档** (位于 `docs/design/ui/`):
- `prd-gap-analysis.md` - PRD差距分析报告（P0/P1/P2缺失项）
- `user-flows.md` - 用户流程图（Mermaid语法，7个功能模块）
- `design-system.md` - 设计系统规范（颜色/字体/间距/圆角/阴影/组件/模板/图标/动效）
- `interaction-specs.md` - 交互标注文档（18个页面逐一标注 + 5个关键流程）

**设计指引** (位于 `docs/design/`):
- `design-guidelines.md` - 项目设计指引

**本地文档** (位于 `docs/rules/`):
- `wechat-miniprogram-ui-design.md` - 微信小程序 UI 设计规范基础版
- `wechat-miniprogram-complete-guide.md` - 完整版设计规范（含组件、动效、适配）

---

## 12. 📝 变更记录规范 (MUST READ)

### 🚨 **强制要求：所有变更必须记录**

**CHANGELOG.md 是项目的"记忆存档"**，用于回放和回顾所有设计变更，防止失忆。每次进行设计修改后，**必须**立即更新变更记录。

### 核心规则

**⬆️ 头部插入原则**
- **每次更新都以【头部插入】方式**，插入到 `CHANGELOG.md` 文件最前面
- 最新的变更永远在文档开头，历史变更按时间倒序排列
- **禁止追加到末尾**，必须插入到文件顶部

### 变更记录格式

```markdown
## [YYYY-MM-DD HH:MM] - 变更标题

### 变更类型
- [新增] 新功能/页面/组件
- [优化] 改进现有设计
- [修复] Bug修复
- [重构] 代码/结构重构
- [删除] 移除功能

### 变更内容
- 具体修改项1
- 具体修改项2
- ...

### 影响范围
- 页面/组件: XXX
- 变量: XXX → YYY
- 文件: cat.pen (节点: xxx)

### 截图验证
- [x] 已截图验证: 首页/功能A
- [ ] 待验证

### 备注
- 相关背景/决策理由
```

### 使用示例

```markdown
## [2026-02-10 11:30] - 首页高端化重构

### 变更类型
- [优化] 首页视觉升级
- [新增] 新增设计变量系统

### 变更内容
1. 重新设计首页Hero区域，使用渐变背景
2. 将图标从emoji替换为抽象几何图形
3. 统一卡片圆角为24px，增强高端感
4. 添加设计变量: coral-primary, bg-cream等

### 影响范围
- 页面: 首页 (节点: 1G9SU)
- 变量: 新增6个颜色变量
- 阴影系统: 新增三级阴影规范

### 截图验证
- [x] 已截图验证: 首页整体效果

### 备注
- 采用高端大气设计风格，参考Apple Design
- 后续页面将统一应用此风格
```

### ⚠️ 重要提醒

1. **实时记录**: 修改完成后立即记录，不要拖延
2. **详细具体**: 记录具体的节点ID、颜色值、尺寸等
3. **可追溯**: 记录要能让他人（或未来的自己）完全理解变更
4. **无变更不提交**: 没有更新CHANGELOG.md的修改视为未完成

### CHANGELOG.md 位置
```
cat-mind/
├── CHANGELOG.md          # ← 变更记录文件
├── cat.pen
└── docs/
```

---

## 13. ⚠️ Pencil MCP 使用注意事项

### ❌ 常见错误

#### 1. 文件路径错误
```
# ❌ 错误 - 使用绝对路径或工作目录外的路径
pencil_batch_design({ filePath: "/Users/.../cat.pen" })

# ✅ 正确 - 使用相对路径（相对于工作目录）
pencil_batch_design({ filePath: "cat.pen" })
```

#### 2. batch_design 操作失败后的状态
- **所有操作会回滚**，但文件可能已部分修改
- **不要重复执行**，先检查文件状态
- **推荐做法**: 使用 `read` 工具查看文件实际状态后再操作

#### 3. JSON语法错误风险
- 直接编辑 `.pen` 文件时要格外小心
- 确保括号、引号匹配
- 修改后使用 JSON 验证器检查：
  ```bash
  python3 -c "import json; json.load(open('cat.pen'))"
  ```

### ✅ 推荐工作流

#### 方式1: 使用 batch_design (适合批量更新)
```javascript
pencil_batch_design({
  filePath: "cat.pen",  // 相对路径！
  operations: `
    U("nodeId", { fill: "#FF0000" })
    U("otherNode", { width: 100 })
  `
})
```

#### 方式2: 使用 Read + Edit (适合精确修改)
```javascript
// 1. 先读取要修改的部分
read({ filePath: "cat.pen", offset: 5500, limit: 50 })

// 2. 使用 edit 精确替换
edit({
  filePath: "cat.pen",
  oldString: '"fill": "#OLD_COLOR"',
  newString: '"fill": "#NEW_COLOR"'
})

// 3. 验证 JSON 完整性
bash({ command: "python3 -c 'import json; json.load(open(\"cat.pen\"))'" })
```

### 🔧 故障排除

| 问题 | 原因 | 解决 |
|-----|------|-----|
| "Failed to find a node" | 节点ID不存在或拼写错误 | 使用 grep 搜索正确的节点ID |
| "ENOENT: no such file" | 文件路径错误 | 使用相对路径 `./cat.pen` 或 `cat.pen` |
| "JSON parse error" | 语法错误，如括号不匹配 | 使用 JSON 验证器定位问题 |
| "Multiple AST nodes detected" | ast_grep 模式匹配到多个节点 | 使用更具体的模式 |

---

*最后更新: 2026-02-12*
