# 设计技能全局安装计划

## 目标
全局安装 7 个设计相关的技能，以提升喵星说明书项目的设计能力。

## 技能列表

### 核心设计技能（高优先级）
1. **design-system-patterns** - 设计系统架构
   - 用途: 设计 Token、主题切换、组件库架构
   - 来源: wshobson/agents
   - 命令: `npx skills add https://github.com/wshobson/agents --skill design-system-patterns -g -y`

2. **web-design-guidelines** - Web 界面设计规范
   - 用途: 检查文件合规性，遵循 Vercel 的 Web Interface Guidelines
   - 来源: vercel-labs/agent-skills
   - 命令: `npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines -g -y`

3. **visual-design-foundations** - 视觉设计基础
   - 用途: 排版、颜色、间距、图标系统
   - 来源: wshobson/agents
   - 命令: `npx skills add https://github.com/wshobson/agents --skill visual-design-foundations -g -y`

### 平台特定技能（中优先级）
4. **mobile-ios-design** - iOS 移动设计
   - 用途: iOS Human Interface Guidelines、SwiftUI 模式
   - 来源: wshobson/agents
   - 命令: `npx skills add https://github.com/wshobson/agents --skill mobile-ios-design -g -y`

5. **shadcn-ui** - shadcn/ui 组件模式
   - 用途: Radix UI + Tailwind CSS 组件最佳实践
   - 来源: giuseppe-trisciuoglio/developer-kit
   - 命令: `npx skills add https://github.com/giuseppe-trisciuoglio/developer-kit --skill shadcn-ui -g -y`

### 进阶技能（中低优先级）
6. **design-motion-principles** - 动效设计
   - 用途: 动效审计（Emil Kowalski、Jakub Krehel 风格）
   - 来源: kylezantos/design-motion-principles
   - 命令: `npx skills add https://github.com/kylezantos/design-motion-principles --skill design-motion-principles -g -y`

7. **ui-ux-pro-max** - 综合 UI/UX 指南
   - 用途: 50+ 样式、97 色板、57 字体组合、99 UX 指南
   - 来源: nextlevelbuilder/ui-ux-pro-max-skill
   - 命令: `npx skills add https://github.com/nextlevelbuilder/ui-ux-pro-max-skill --skill ui-ux-pro-max -g -y`

## 执行顺序

### 批次 1 - 核心技能（并行）
```bash
npx skills add https://github.com/wshobson/agents --skill design-system-patterns -g -y &
npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines -g -y &
npx skills add https://github.com/wshobson/agents --skill visual-design-foundations -g -y &
wait
```

### 批次 2 - 平台技能（并行）
```bash
npx skills add https://github.com/wshobson/agents --skill mobile-ios-design -g -y &
npx skills add https://github.com/giuseppe-trisciuoglio/developer-kit --skill shadcn-ui -g -y &
wait
```

### 批次 3 - 进阶技能（并行）
```bash
npx skills add https://github.com/kylezantos/design-motion-principles --skill design-motion-principles -g -y &
npx skills add https://github.com/nextlevelbuilder/ui-ux-pro-max-skill --skill ui-ux-pro-max -g -y &
wait
```

### 验证安装
```bash
npx skills list -g
```

## 预期输出
安装成功后，运行 `npx skills list -g` 应显示以下技能：
- design-system-patterns
- web-design-guidelines
- visual-design-foundations
- mobile-ios-design
- shadcn-ui
- design-motion-principles
- ui-ux-pro-max
- 以及已有的: pencil-ui-design, design-system-patterns, find-skills

## 使用建议

### 在喵星说明书项目中
1. **design-system-patterns**: 用于规范化设计 Token 系统（颜色、间距、圆角）
2. **visual-design-foundations**: 用于审核和改进现有的配色和排版
3. **web-design-guidelines**: 用于检查设计是否符合现代 Web 界面规范
4. **mobile-ios-design**: 虽然目标是微信小程序，但可以借鉴 iOS 设计原则

### 何时调用技能
- 设计新页面时: 调用 `design-system-patterns` + `visual-design-foundations`
- 审核现有设计: 调用 `web-design-guidelines`
- 优化动效: 调用 `design-motion-principles`
- 需要灵感: 调用 `ui-ux-pro-max`

## 验证标准
- [ ] 所有 7 个技能安装成功，无报错
- [ ] `npx skills list -g` 显示所有技能
- [ ] 每个技能的 SKILL.md 文件存在且可读
- [ ] 技能可以在项目中正常调用

## 回滚方案
如需卸载某个技能：
```bash
rm -rf ~/.agents/skills/<skill-name>
```

## 参考
- Skills 官网: https://skills.sh/
- 搜索技能: `npx skills find <keyword>`
- 查看已安装: `npx skills list -g`
- 更新技能: `npx skills update`
