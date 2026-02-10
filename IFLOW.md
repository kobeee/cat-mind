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
├── cat.pen                   # Pencil 设计文件（7个页面）
├── src                       # 项目源码目录
├── docs/
│   ├── prd/v1.0.md           # 产品需求文档
│   ├── design/               # 设计相关文档
│   └── rules/                # 设计规范文档
└── AGENTS.md                 # 本文件
```

**已设计页面**: 首页、AI喵相学、CBTI测试、说明书结果、听力统考、爪速挑战、双猫匹配

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
const x = 7 * 502; // 第8个页面位置
newPage = I(document, {
  type: "frame",
  name: "新页面名称",
  x: x, y: 0,
  width: 402, height: 874,
  fill: "$bg-page",
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

## 11. 已安装技能

### 项目本地技能 (`.iflow/skills/`)

以下技能已复制到项目本地，iFlow CLI 会自动读取并应用：

#### 🎨 UI/UX 设计核心
| 技能名称 | 功能描述 | 来源 |
|---------|---------|------|
| **ui-ux-pro-max** | 最全面的设计系统：67种UI风格、96种配色、57种字体、100+行业规则 | nextlevelbuilder |
| **pencil-ui-design** | Pencil MCP 工业级 UI 设计规范和工作流 | 本地 |
| **baseline-ui** | UI基线规范，确保设计一致性 | ibelick/ui-skills |
| **web-design-guidelines** | Web设计最佳实践（100+规则） | vercel-labs |

#### 🔧 修复与优化
| 技能名称 | 功能描述 |
|---------|---------|
| **fixing-accessibility** | 可访问性检查与修复（ARIA、键盘导航、语义化） |
| **fixing-motion-performance** | 动效性能优化（prefers-reduced-motion、合成器友好） |
| **fixing-metadata** | 元数据修复（标题、meta、社交卡片） |

#### ⚛️ 框架与开发
| 技能名称 | 功能描述 |
|---------|---------|
| **design-system-patterns** | 设计系统构建模式和架构 |
| **vercel-react-best-practices** | React/Next.js性能优化（40+规则） |
| **vercel-react-native-skills** | React Native 开发规范 |
| **remotion-best-practices** | 视频/动画制作最佳实践 |

#### 🔍 工具类
| 技能名称 | 功能描述 |
|---------|---------|
| **find-skills** | 技能查找工具 |

### 技能使用指南

iFlow CLI 会根据任务内容**自动加载**相关技能。例如：

- **设计UI界面** → 自动使用 `ui-ux-pro-max` + `baseline-ui` + `fixing-accessibility`
- **优化性能** → 自动使用 `vercel-react-best-practices` 或 `fixing-motion-performance`
- **Pencil设计** → 自动使用 `pencil-ui-design`

### 手动安装新技能

如需添加更多技能，使用以下命令：

```bash
# 查看已安装技能
npx skills list -g

# 查找新技能
npx skills find <keyword>

# 安装技能到全局
npx skills add <owner/repo> -g -y

# 示例：安装 UI 优化套件
npx skills add ibelick/ui-skills -g -y
```

安装后会自动链接到 `~/.agents/skills/`，可复制到项目：

```bash
cp -r ~/.agents/skills/<skill-name> .iflow/skills/
```

---

## 12. 设计规范文档

**本地文档** (位于 `docs/rules/`):
- `wechat-miniprogram-ui-design.md` - 微信小程序 UI 设计规范基础版
- `wechat-miniprogram-complete-guide.md` - 完整版设计规范（含组件、动效、适配）

**技能文档**:
- `~/.agents/skills/pencil-ui-design/SKILL.md` - Pencil 设计系统规范
- `~/.agents/skills/pencil-ui-design/components.md` - 组件详细规范
- `~/.agents/skills/design-system-patterns/SKILL.md` - 设计系统模式

---

## 13. 📝 变更记录规范 (MUST READ)

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

*最后更新: 2026-02-10*
