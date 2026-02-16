# 喵星说明书 iOS 端详细设计方案

> 版本: v1.0  
> 日期: 2026-02-15  
> 技术栈: SwiftUI + iOS 17+ + SwiftData  
> 目标: 100% 还原 cat.pen 视觉稿，功能闭环

---

## 1. 技术架构决策

### 1.1 为什么选择 SwiftUI + iOS 17+

| 特性 | iOS 17+ 优势 | 本项目应用 |
|------|-------------|-----------|
| `@Observable` 宏 | 自动追踪依赖，无需 `@Published` | 所有 ViewModel |
| `PhaseAnimator` | 复杂关键帧动画 | 扫描动画、加载动画 |
| `SwiftData` | 声明式数据持久化 | 用户档案、测试记录 |
| `NavigationStack` 增强 | 编程式导航更强大 | 全应用导航 |
| `ScrollView` 增强 | 更好的滚动控制 | 长列表页面 |
| `ContentUnavailableView` | 空状态标准组件 | 未测试状态 |

### 1.2 项目结构

```
src/ios/MeowManual/
├── App/
│   ├── MeowManualApp.swift          # App 入口
│   └── AppRouter.swift              # 全局路由管理
├── Core/
│   ├── DesignSystem/
│   │   ├── Colors.swift             # 设计系统颜色
│   │   ├── Typography.swift         # 字体规范
│   │   ├── Shadows.swift            # 阴影系统
│   │   └── Components/              # 可复用组件
│   │       ├── MMCard.swift
│   │       ├── MMButton.swift
│   │       ├── MMNavigationBar.swift
│   │       ├── MMTabBar.swift
│   │       └── MMProgressBar.swift
│   ├── Models/
│   │   ├── CatProfile.swift         # 猫咪档案模型
│   │   ├── CBTIQuestion.swift       # CBTI 题目模型
│   │   ├── TestResult.swift         # 测试结果模型
│   │   └── HearingSound.swift       # 声音测试模型
│   ├── ViewModels/
│   │   ├── HomeViewModel.swift
│   │   ├── AIFaceViewModel.swift
│   │   ├── CBTIViewModel.swift
│   │   ├── HearingViewModel.swift
│   │   ├── PawChallengeViewModel.swift
│   │   └── MatchViewModel.swift
│   └── Services/
│       ├── MockDataService.swift    # Mock 数据层
│       ├── StorageService.swift     # 本地存储
│       └── HapticService.swift      # 震动反馈
├── Features/
│   ├── Home/
│   │   ├── HomeView.swift           # 首页
│   │   ├── DailyCalendarCard.swift  # 每日猫历卡片
│   │   └── FeatureGrid.swift        # 功能网格
│   ├── AIFace/
│   │   ├── AIFaceView.swift         # AI喵相学
│   │   ├── AIScanningView.swift     # 扫描中
│   │   └── AIDiagnosisView.swift    # 诊断单
│   ├── CBTI/
│   │   ├── CBTITestView.swift       # 测试页面
│   │   ├── ManualGeneratingView.swift # 生成中
│   │   └── ManualView.swift         # 说明书
│   ├── Hearing/
│   │   ├── HearingTestView.swift    # 听力统考
│   │   └── HearingRadarView.swift   # 雷达图
│   ├── PawChallenge/
│   │   ├── PawReadyView.swift       # 准备页
│   │   ├── PawGameView.swift        # 游戏页
│   │   └── PawResultView.swift      # 结果页
│   ├── Match/
│   │   ├── MatchView.swift          # 双猫匹配
│   │   ├── MatchInviteView.swift    # 邀请页
│   │   └── SharePosterView.swift    # 分享海报
│   ├── Archive/
│   │   └── ArchiveView.swift        # 档案
│   ├── Rank/
│   │   ├── RankSpeedView.swift      # 手速榜
│   │   └── RankBeautyView.swift     # 颜值榜
│   └── Profile/
│       └── ProfileView.swift        # 我的
└── Resources/
    ├── Assets.xcassets/
    └── Sounds/                      # 猫咪声音资源
```

---

## 2. 设计系统映射

### 2.1 颜色系统 (Colors.swift)

```swift
import SwiftUI

extension Color {
    // MARK: - Brand Colors
    static let coralPrimary = Color("#FF7A50")
    static let coralSecondary = Color("#FF6B6B")
    static let coralGradientStart = Color("#FF8A65")
    static let coralGradientEnd = Color("#FF6B6B")
    
    // MARK: - Accent Colors
    static let accentOrange = Color("#F97316")
    static let accentYellow = Color("#FBBF24")
    static let champagneGold = Color("#FFD166")
    static let successGreen = Color("#34C759")
    static let dangerRed = Color("#FF453A")
    
    // MARK: - Text Colors (Light Mode)
    static let inkBlack = Color("#1A1A1A")
    static let textPrimary = Color("#2D2D2D")
    static let textSecondary = Color("#78716C")
    static let textTertiary = Color("#8E8E93")
    static let grayPrimary = Color("#6B7280")
    static let graySecondary = Color("#9CA3AF")
    static let grayTertiary = Color("#D1D5DB")
    
    // MARK: - Background Colors
    static let bgCream = Color("#FAF9F7")
    static let bgPure = Color("#FFFFFF")
    static let bgGray = Color("#F5F5F7")
    static let bgSurface = Color("#E7E5E4")
    
    // MARK: - Dark Mode Colors
    static let bgDeep = Color("#0D0D0F")
    static let bgDark = Color("#1C1C1E")
    static let bgElevatedDark = Color("#2C2C2E")
}

// MARK: - Gradients
extension LinearGradient {
    static let coralGradient = LinearGradient(
        colors: [.coralGradientStart, .coralGradientEnd],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let darkCardGradient = LinearGradient(
        colors: [Color("#1C1C1E"), Color("#252528")],
        startPoint: .top,
        endPoint: .bottom
    )
}
```

### 2.2 字体系统 (Typography.swift)

```swift
import SwiftUI

extension Font {
    // MARK: - Display
    static let displayLarge = Font.system(size: 42, weight: .heavy, design: .rounded)
    static let displayMedium = Font.system(size: 30, weight: .bold, design: .rounded)
    
    // MARK: - Headlines
    static let headlineLarge = Font.system(size: 28, weight: .bold)
    static let headlineMedium = Font.system(size: 22, weight: .semibold)
    static let headlineSmall = Font.system(size: 18, weight: .semibold)
    
    // MARK: - Body
    static let bodyLarge = Font.system(size: 17, weight: .regular)
    static let bodyMedium = Font.system(size: 16, weight: .regular)
    static let bodySmall = Font.system(size: 15, weight: .regular)
    
    // MARK: - Caption
    static let captionLarge = Font.system(size: 14, weight: .medium)
    static let captionMedium = Font.system(size: 13, weight: .medium)
    static let captionSmall = Font.system(size: 12, weight: .regular)
    static let captionTiny = Font.system(size: 11, weight: .medium)
    
    // MARK: - Special
    static let scoreDisplay = Font.system(size: 48, weight: .bold, design: .rounded)
    static let comboDisplay = Font.system(size: 64, weight: .black, design: .rounded)
}
```

### 2.3 间距与圆角

```swift
enum DesignSystem {
    // MARK: - Spacing
    static let space1: CGFloat = 4
    static let space2: CGFloat = 8
    static let space3: CGFloat = 12
    static let space4: CGFloat = 16
    static let space5: CGFloat = 20
    static let space6: CGFloat = 24
    static let space8: CGFloat = 32
    
    // MARK: - Radius
    static let radiusSmall: CGFloat = 8
    static let radiusMedium: CGFloat = 12
    static let radiusLarge: CGFloat = 16
    static let radiusXLarge: CGFloat = 24
    static let radiusFull: CGFloat = 999
    
    // MARK: - Layout
    static let pagePadding: CGFloat = 20
    static let cardPadding: CGFloat = 20
    static let sectionSpacing: CGFloat = 24
}
```

---

## 3. 核心组件设计

### 3.1 主按钮 (MMButton.swift)

```swift
struct MMButton: View {
    enum Style {
        case primary
        case secondary
        case dark
    }
    
    let title: String
    let style: Style
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.bodyMedium.weight(.semibold))
                .foregroundColor(foregroundColor)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(backgroundView)
        }
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .primary:
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient.coralGradient)
                .shadow(color: .coralPrimary.opacity(0.3), radius: 12, y: 4)
        case .secondary:
            RoundedRectangle(cornerRadius: 16)
                .fill(.bgPure)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.grayTertiary, lineWidth: 1)
                )
        case .dark:
            RoundedRectangle(cornerRadius: 16)
                .fill(.accentOrange)
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .primary, .dark: return .white
        case .secondary: return .inkBlack
        }
    }
}
```

### 3.2 导航栏 (MMNavigationBar.swift)

```swift
struct MMNavigationBar: View {
    let title: String
    let showBackButton: Bool
    let onBack: (() -> Void)?
    
    var body: some View {
        HStack {
            if showBackButton {
                Button(action: { onBack?() }) {
                    Image(systemName: "arrow.backward")
                        .font(.bodyLarge.weight(.semibold))
                        .foregroundColor(.grayPrimary)
                        .frame(width: 40, height: 40)
                        .background(.bgGray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            } else {
                Color.clear.frame(width: 40, height: 40)
            }
            
            Spacer()
            
            Text(title)
                .font(.headlineSmall)
                .foregroundColor(.textPrimary)
            
            Spacer()
            
            // 右侧占位保持对称
            Color.clear.frame(width: 40, height: 40)
        }
        .padding(.horizontal, DesignSystem.pagePadding)
        .frame(height: 56)
    }
}
```

### 3.3 Tab 栏 (MMTabBar.swift)

```swift
struct MMTabBar: View {
    @Binding var selectedTab: Tab
    
    enum Tab: Int, CaseIterable {
        case home, archive, rank, profile
        
        var icon: String {
            switch self {
            case .home: return "house.fill"
            case .archive: return "folder.fill"
            case .rank: return "trophy.fill"
            case .profile: return "person.fill"
            }
        }
        
        var title: String {
            switch self {
            case .home: return "首页"
            case .archive: return "档案"
            case .rank: return "排行"
            case .profile: return "我的"
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabItem(
                    icon: tab.icon,
                    title: tab.title,
                    isSelected: selectedTab == tab
                )
                .onTapGesture {
                    withAnimation(.spring(response: 0.3)) {
                        selectedTab = tab
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .padding(.bottom, 34) // 安全区
        .background(.ultraThinMaterial)
    }
}

struct TabItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 24, weight: isSelected ? .semibold : .regular))
            
            if isSelected {
                Text(title)
                    .font(.captionTiny)
            }
        }
        .foregroundColor(isSelected ? .inkBlack : .graySecondary)
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(isSelected ? .white : .clear)
        )
    }
}
```

---

## 4. 页面实现计划

### 4.1 首页 (HomeView.swift)

**视觉稿对应**: 首页 (1G9SU)

**结构**:
```
ScrollView
├── 头部区域 (标题 + 头像)
├── 每日猫历卡片 (深色渐变)
├── 探索功能标题
├── 功能网格 (2x2)
│   ├── AI喵相学卡片
│   ├── CBTI测试卡片
│   ├── 喵语听力卡片
│   └── 爪速挑战卡片
├── 更多玩法标题
└── 双猫匹配卡片
```

**关键实现**:
- 使用 `LazyVStack` 优化滚动性能
- 功能卡片使用 `Grid` 布局
- 每日猫历卡片独立组件 `DailyCalendarCard`

### 4.2 AI喵相学流程

**页面链**:
1. `AIFaceView` - 上传照片
2. `AIScanningView` - 扫描动画 (PhaseAnimator)
3. `AIDiagnosisView` - 诊断单结果

**扫描动画**:
```swift
PhaseAnimator([0, 1], trigger: isScanning) { phase in
    ScanningLine()
        .offset(y: phase == 0 ? 0 : 200)
}
```

### 4.3 CBTI 测试流程

**页面链**:
1. `CBTITestView` - 答题 (20题)
2. `ManualGeneratingView` - 生成动画
3. `ManualView` - 说明书结果

**答题交互**:
- 单选题，选中后立即进入下一题
- 进度条实时更新
- 支持返回上一题

### 4.4 爪速挑战游戏

**页面链**:
1. `PawReadyView` - 游戏规则
2. `PawGameView` - 游戏核心
3. `PawResultView` - 结果展示

**游戏机制**:
- 倒计时 30 秒
- 随机出现目标点 (红点)
- 点击计分，连击加成
- 实时显示连击数和时间

---

## 5. 数据模型设计

### 5.1 猫咪档案 (CatProfile.swift)

```swift
import SwiftData

@Model
class CatProfile {
    @Attribute(.unique) var id: UUID
    var name: String
    var emoji: String
    var faceScore: Int
    var cbtiType: String
    var tags: [String]
    var createdAt: Date
    
    // CBTI 维度
    var clingyLevel: Int
    var activityLevel: Int
    var curiosityLevel: Int
    var gentlenessLevel: Int
    
    init(name: String, emoji: String) {
        self.id = UUID()
        self.name = name
        self.emoji = emoji
        self.faceScore = 0
        self.cbtiType = ""
        self.tags = []
        self.createdAt = Date()
        self.clingyLevel = 0
        self.activityLevel = 0
        self.curiosityLevel = 0
        self.gentlenessLevel = 0
    }
}
```

### 5.2 CBTI 题目 (CBTIQuestion.swift)

```swift
struct CBTIQuestion: Identifiable {
    let id: Int
    let question: String
    let options: [CBTIOption]
    let dimension: CBTIDimension
}

struct CBTIOption {
    let label: String
    let text: String
    let score: Int
}

enum CBTIDimension: String {
    case clingy = "粘人度"
    case activity = "活泼度"
    case curiosity = "好奇心"
    case gentleness = "温顺度"
}
```

---

## 6. Mock 数据策略

### 6.1 首页 Mock

```swift
enum MockData {
    static let dailyCalendar = DailyCalendar(
        date: "2月15日 周六",
        weather: "🌧️ 雨天 · 气压低",
        description: "您的【怂包型】主子可能电量不足",
        goodThings: ["躲在纸箱里", "喂冻干"],
        badThings: ["吸尘器", "强行抱抱"]
    )
    
    static let featureCards: [FeatureCard] = [
        FeatureCard(
            title: "AI喵相学",
            subtitle: "面相速测",
            icon: "face.smiling.fill",
            gradient: [.coralGradientStart, .coralGradientEnd]
        ),
        // ... 其他卡片
    ]
}
```

### 6.2 CBTI 题库 Mock

```swift
extension MockData {
    static let cbtiQuestions: [CBTIQuestion] = [
        CBTIQuestion(
            id: 1,
            question: "当快递员敲门时，你家主子的反应是？",
            options: [
                CBTIOption(label: "A", text: "骂骂咧咧冲门口", score: 5),
                CBTIOption(label: "B", text: "瞬间移动到床底", score: 2),
                CBTIOption(label: "C", text: "毫无波澜继续睡", score: 3)
            ],
            dimension: .activity
        ),
        // ... 20题
    ]
}
```

---

## 7. 动画与交互规范

### 7.1 转场动画

```swift
// 页面进入
.transition(.move(edge: .trailing).combined(with: .opacity))

// 卡片出现
.transition(.scale(scale: 0.9).combined(with: .opacity))

// 列表项
.transition(.asymmetric(
    insertion: .move(edge: .trailing),
    removal: .move(edge: .leading)
))
```

### 7.2 交互动画

```swift
// 按钮按下
Button(action: action) {
    Text(title)
}
.pressEffect() // 自定义 modifier

// 卡片点击
.cardTapEffect()

// 震动反馈
HapticService.shared.light()
```

### 7.3 特殊动画

**扫描线动画**:
```swift
struct ScanningLine: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient.coralGradient)
            .frame(height: 2)
            .shadow(color: .coralPrimary, radius: 4)
    }
}
```

**进度条动画**:
```swift
struct MMProgressBar: View {
    let progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.bgGray)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(LinearGradient.coralGradient)
                    .frame(width: geometry.size.width * progress)
                    .animation(.easeInOut(duration: 0.3), value: progress)
            }
        }
        .frame(height: 4)
    }
}
```

---

## 8. 文件长度控制策略

严格遵循单文件不超过 200 行的规范：

| 页面 | 主文件 | 拆分组件 |
|------|--------|----------|
| 首页 | HomeView.swift (150行) | DailyCalendarCard.swift, FeatureGrid.swift |
| AI喵相学 | AIFaceView.swift (120行) | PhotoUploader.swift |
| CBTI测试 | CBTITestView.swift (140行) | QuestionCard.swift, OptionButton.swift |
| 喵星说明书 | ManualView.swift (160行) | ModelCard.swift, SpecBar.swift, GuideRow.swift |
| 爪速挑战 | PawGameView.swift (180行) | GameArea.swift, TargetView.swift |

---

## 9. 验证计划

### 9.1 使用 Xcode Simulator 验证

```bash
# 构建项目
xcodebuild -project MeowManual.xcodeproj -scheme MeowManual -destination 'platform=iOS Simulator,name=iPhone 15 Pro' build

# 运行测试
xcodebuild test -project MeowManual.xcodeproj -scheme MeowManual -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

### 9.2 视觉对照检查清单

- [ ] 颜色与设计系统一致
- [ ] 字体大小和字重正确
- [ ] 间距和圆角符合规范
- [ ] 阴影效果正确
- [ ] 页面跳转流畅
- [ ] 交互动画自然

---

## 10. 开发顺序

1. **Phase 1**: 设计系统 + 基础组件 (Colors, Typography, MMButton, MMNavigationBar, MMTabBar)
2. **Phase 2**: 数据模型 + Mock 服务 (CatProfile, CBTIQuestion, MockDataService)
3. **Phase 3**: Tab 页面 (Home, Archive, Rank, Profile)
4. **Phase 4**: AI 流程 (AIFace, AIScanning, AIDiagnosis)
5. **Phase 5**: CBTI 流程 (CBTITest, ManualGenerating, Manual)
6. **Phase 6**: 实验室功能 (HearingTest, HearingRadar, PawReady, PawGame)
7. **Phase 7**: 社交功能 (Match, MatchInvite, SharePoster)
8. **Phase 8**: 全局优化 + 视觉调优

---

*本设计方案为唯一实施路径，所有技术决策均以"现代化、不保守"为原则。*
