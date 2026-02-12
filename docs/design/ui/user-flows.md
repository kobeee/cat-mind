# 喵星说明书 - 用户流程图

> 版本: v1.0 | 更新日期: 2026-02-12

---

## 1. 全局导航架构

### 1.1 Tab 导航结构

```
┌─────────────────────────────────────────────────┐
│                  喵星说明书 App                    │
├────────────┬────────────┬───────────┬────────────┤
│   🏠 首页   │  📋 档案   │  🏆 排行   │  👤 我的   │
│  (Tab 1)   │  (Tab 2)  │  (Tab 3)  │  (Tab 4)  │
└────────────┴────────────┴───────────┴────────────┘
```

### 1.2 页面层级关系

```
Level 0 (TabBar)          Level 1 (子页面)           Level 2 (结果页)
─────────────────         ──────────────────         ──────────────────
首页 ─────────────────┬── AI喵相学 ──────────────── 喵相诊断单(结果)
│ · 每日猫历卡片       │
│ · 4功能入口          ├── CBTI测试 ─────────────── 喵星说明书(结果)
│ · 更多玩法区         │
│                     ├── 喵语听力统考 ──────────── 听觉雷达图结果
│                     │
│                     ├── 爪速大挑战 ────────────── 爪速结算页(内嵌)
│                     │
│                     └── 双猫匹配 ─────────────── 匹配结果(内嵌)

档案 ─────────────────── (无子页面，直接展示猫咪档案+测试记录)

排行 ─────────────────┬── 手速榜 (默认)
                      └── 颜值榜

我的 ─────────────────── (无子页面，用户中心+设置)
```

### 1.3 页面跳转关系图 (Mermaid)

```mermaid
graph TD
    subgraph TabBar["TabBar 导航"]
        HOME["🏠 首页"]
        ARCHIVE["📋 档案"]
        RANK["🏆 排行"]
        ME["👤 我的"]
    end

    HOME -->|"功能入口1"| AI_FACE["AI喵相学"]
    HOME -->|"功能入口2"| CBTI["CBTI测试"]
    HOME -->|"功能入口3"| HEARING["喵语听力统考"]
    HOME -->|"功能入口4"| PAW["爪速大挑战"]
    HOME -->|"更多玩法"| MATCH["双猫匹配"]
    HOME -->|"猫历卡片点击"| CAT_CALENDAR["猫历详情(弹窗)"]

    AI_FACE -->|"扫描完成"| AI_RESULT["喵相诊断单"]
    AI_RESULT -->|"分享"| SHARE_POSTER["分享海报"]
    AI_RESULT -->|"返回"| HOME

    CBTI -->|"完成20题"| MANUAL["喵星说明书"]
    MANUAL -->|"分享"| SHARE_POSTER
    MANUAL -->|"保存到档案"| ARCHIVE
    MANUAL -->|"返回"| HOME

    HEARING -->|"完成测试"| RADAR["听觉雷达图结果"]
    RADAR -->|"分享"| SHARE_POSTER
    RADAR -->|"返回"| HOME

    PAW -->|"游戏结束"| PAW_RESULT["爪速结算页"]
    PAW_RESULT -->|"分享"| SHARE_POSTER
    PAW_RESULT -->|"再来一局"| PAW
    PAW_RESULT -->|"返回"| HOME

    MATCH -->|"匹配完成"| MATCH_RESULT["匹配结果"]
    MATCH_RESULT -->|"邀请好友"| SHARE_POSTER
    MATCH_RESULT -->|"返回"| HOME

    RANK -->|"默认"| SPEED_RANK["手速榜"]
    RANK -->|"切换Tab"| BEAUTY_RANK["颜值榜"]

    ARCHIVE -->|"查看测试记录"| MANUAL
    ARCHIVE -->|"查看雷达图"| RADAR

    ME -->|"查看我的猫咪"| ARCHIVE

    style HOME fill:#07C160,color:#fff
    style ARCHIVE fill:#07C160,color:#fff
    style RANK fill:#07C160,color:#fff
    style ME fill:#07C160,color:#fff
```

---

## 2. 核心用户旅程

### 2.1 三阶段用户路径

```mermaid
graph LR
    subgraph Phase1["阶段一：首次进入（钩子）"]
        P1_START["打开小程序"] --> P1_HOME["首页"]
        P1_HOME --> P1_AI["AI喵相学"]
        P1_AI --> P1_UPLOAD["上传猫咪照片"]
        P1_UPLOAD --> P1_SCAN["扫描动画"]
        P1_SCAN --> P1_REPORT["初级报告<br/>喵相诊断单"]
        P1_REPORT --> P1_SHARE["分享到朋友圈"]
    end

    subgraph Phase2["阶段二：深度使用（核心）"]
        P2_ENTRY["再次进入"] --> P2_CBTI["CBTI行为测试"]
        P2_CBTI --> P2_Q["回答20道趣味问卷"]
        P2_Q --> P2_MANUAL["生成喵星说明书"]
        P2_MANUAL --> P2_SAVE["保存到档案"]
        P2_MANUAL --> P2_SHARE2["分享说明书"]
    end

    subgraph Phase3["阶段三：日常留存（粘性）"]
        P3_DAILY["每日打开"] --> P3_CAL["查看每日猫历"]
        P3_DAILY --> P3_HEAR["喵语听力实验"]
        P3_DAILY --> P3_PAW["爪速挑战"]
        P3_PAW --> P3_RANK["冲击排行榜"]
    end

    Phase1 --> Phase2
    Phase2 --> Phase3
```

### 2.2 新用户首次体验流程 (First-Time User Experience)

```mermaid
graph TD
    START["用户扫码/搜索进入"] --> AUTH{"微信授权"}
    AUTH -->|"允许"| HOME["首页加载"]
    AUTH -->|"拒绝"| GUEST["游客模式<br/>(功能受限)"]
    GUEST --> HOME

    HOME --> GUIDE["新手引导气泡<br/>指向AI喵相学入口"]
    GUIDE --> AI_ENTRY["点击AI喵相学"]
    AI_ENTRY --> UPLOAD["上传猫咪正脸照"]
    UPLOAD --> SCAN["高科技扫描动画<br/>(网格线扫描)"]
    SCAN --> RESULT["喵相诊断单<br/>面相评分+核心槽点"]
    RESULT --> SHARE_DECISION{"分享?"}
    SHARE_DECISION -->|"是"| POSTER["生成分享海报<br/>(含二维码)"]
    SHARE_DECISION -->|"否"| BACK_HOME["返回首页"]
    POSTER --> WX_SHARE["分享到朋友圈/好友"]
    WX_SHARE --> BACK_HOME
    BACK_HOME --> NUDGE["引导卡片:<br/>想深入了解主子?<br/>试试CBTI测试"]
```

---

## 3. 各功能模块详细流程

### 3.1 AI喵相学

```mermaid
graph TD
    ENTRY["首页 → 点击AI喵相学入口"] --> PAGE["AI喵相学页面"]
    PAGE --> UPLOAD_BTN["点击上传照片"]
    UPLOAD_BTN --> SOURCE{"照片来源"}
    SOURCE -->|"拍照"| CAMERA["调用相机"]
    SOURCE -->|"相册"| ALBUM["选择相册照片"]
    CAMERA --> PREVIEW["照片预览"]
    ALBUM --> PREVIEW

    PREVIEW --> CONFIRM{"确认使用?"}
    CONFIRM -->|"重拍"| SOURCE
    CONFIRM -->|"确认"| UPLOAD["上传照片"]

    UPLOAD --> SCAN["扫描动画<br/>网格线扫描眼睛/耳朵/胡须"]
    SCAN --> ANALYZE["AI分析中<br/>(猫爪踩奶加载动画)"]
    ANALYZE --> RESULT["喵相诊断单"]

    subgraph RESULT_CONTENT["诊断单内容"]
        R1["面相评分: 98分 旺家相"]
        R2["花色识别: 橘色→易胖体质"]
        R3["瞳孔分析: 鄙视链顶端"]
        R4["核心槽点: 没受过欺负的脸"]
    end

    RESULT --> ACTION{"用户操作"}
    ACTION -->|"分享"| POSTER["生成海报<br/>(含双猫匹配二维码)"]
    ACTION -->|"保存图片"| SAVE_IMG["保存到相册"]
    ACTION -->|"再测一次"| SOURCE
    ACTION -->|"返回"| HOME["返回首页"]

    POSTER --> WX["分享到微信"]
    WX --> HOME
```

### 3.2 CBTI 深度性格测试

```mermaid
graph TD
    ENTRY["首页 → 点击CBTI测试入口"] --> INTRO["测试介绍页<br/>Feline Five猫科五大性格"]
    INTRO --> START["开始测试"]

    START --> Q["第N题 (共20题)<br/>趣味情景题"]

    subgraph QUESTION_FLOW["答题流程"]
        Q --> SELECT["选择答案<br/>(震动反馈)"]
        SELECT --> PROGRESS["进度条更新<br/>N/20"]
        PROGRESS --> NEXT{"还有下一题?"}
        NEXT -->|"是"| Q
        NEXT -->|"否"| CALC["计算性格结果"]
    end

    CALC --> LOADING["生成中...<br/>(猫尾巴摇摆动画)"]
    LOADING --> MANUAL["喵星说明书"]

    subgraph MANUAL_CONTENT["说明书内容(工业风)"]
        M1["出厂型号: E型社牛猫"]
        M2["性能参数:<br/>粘人度80%/攻击力10%/智商(数据丢失)"]
        M3["槽点集锦"]
        M4["维护指南: 宜拍屁股/忌剪指甲"]
        M5["质保二维码"]
    end

    MANUAL --> ACTION{"用户操作"}
    ACTION -->|"分享说明书"| POSTER["生成工业风海报"]
    ACTION -->|"保存到档案"| ARCHIVE["保存至档案Tab"]
    ACTION -->|"查看详细参数"| DETAIL["展开详细数据"]
    ACTION -->|"返回首页"| HOME["首页"]

    POSTER --> WX["分享到微信"]

    %% 中途退出
    Q -->|"返回/退出"| EXIT_CONFIRM{"确认退出?<br/>进度将保存"}
    EXIT_CONFIRM -->|"继续"| Q
    EXIT_CONFIRM -->|"退出"| HOME
```

### 3.3 喵语听力统考

```mermaid
graph TD
    ENTRY["首页 → 点击喵语听力入口"] --> PAGE["听力统考页面"]

    PAGE --> CAT_SELECT{"选择分类"}
    CAT_SELECT -->|"召唤系"| CAT1["开罐头声/摇猫粮声"]
    CAT_SELECT -->|"挑衅系"| CAT2["同类打架声/哈气声"]
    CAT_SELECT -->|"猎奇系"| CAT3["鸟叫声/老鼠声"]

    CAT1 --> CARD["声音卡片"]
    CAT2 --> CARD
    CAT3 --> CARD

    CARD --> PLAY["点击播放声音<br/>(对着猫咪播放)"]
    PLAY --> POPUP["弹窗: 主子反应如何?"]

    POPUP --> REACT{"选择反应"}
    REACT -->|"A. 飞机耳"| RECORD["记录数据"]
    REACT -->|"B. 炸毛"| RECORD
    REACT -->|"C. 无视"| RECORD
    REACT -->|"D. 其他"| RECORD

    RECORD --> TAG["生成性格标签<br/>如: C→高冷/听觉过滤系统开启"]
    TAG --> MORE{"继续测试?"}
    MORE -->|"下一个声音"| CARD
    MORE -->|"换分类"| CAT_SELECT
    MORE -->|"完成测试"| GENERATE["生成听觉雷达图"]

    GENERATE --> RADAR["听觉雷达图结果页"]

    subgraph RADAR_CONTENT["雷达图内容"]
        RD1["召唤系敏感度"]
        RD2["挑衅系敏感度"]
        RD3["猎奇系敏感度"]
        RD4["综合听觉评级"]
        RD5["性格标签集合"]
    end

    RADAR --> ACTION{"用户操作"}
    ACTION -->|"分享"| POSTER["生成雷达图海报"]
    ACTION -->|"保存"| ARCHIVE["保存至档案"]
    ACTION -->|"返回"| HOME["返回首页"]
```

### 3.4 爪速大挑战

```mermaid
graph TD
    ENTRY["首页 → 点击爪速挑战入口"] --> INTRO["游戏说明页<br/>把手机放在猫面前"]
    INTRO --> READY["准备倒计时 3-2-1"]
    READY --> GAME["游戏进行中"]

    subgraph GAME_PLAY["Canvas游戏区"]
        G1["目标出现<br/>(红点/苍蝇/老鼠)"]
        G2["不规则运动轨迹"]
        G3["猫爪触碰检测"]
        G4["连击Combo计数"]
        G5["震动反馈(每次命中)"]
    end

    GAME --> TIMEOUT["时间到!"]
    TIMEOUT --> SETTLE["结算页面"]

    subgraph SETTLE_CONTENT["结算内容(炫耀向)"]
        S1["战力值(非分数)"]
        S2["有效出拳: 38次"]
        S3["击败全小区99%的猫"]
        S4["称号: 无影爪宗师"]
        S5["最高连击: 12 Combo"]
    end

    SETTLE --> ACTION{"用户操作"}
    ACTION -->|"分享战绩"| POSTER["生成战绩海报"]
    ACTION -->|"再来一局"| READY
    ACTION -->|"查看排行"| RANK["跳转排行榜Tab"]
    ACTION -->|"返回首页"| HOME["首页"]

    POSTER --> WX["分享到微信"]
```

### 3.5 双猫匹配

```mermaid
graph TD
    ENTRY["首页 → 更多玩法 → 双猫匹配"] --> CHECK{"已有猫咪档案?"}
    CHECK -->|"有"| SELECT_MINE["选择我的猫咪"]
    CHECK -->|"无"| CREATE["先完成AI喵相学<br/>或CBTI测试"]
    CREATE --> AI["跳转AI喵相学"]

    SELECT_MINE --> INVITE["生成邀请海报<br/>(含测测缘分二维码)"]
    INVITE --> SHARE["分享给好友"]
    SHARE --> WAIT["等待好友扫码"]

    WAIT --> FRIEND_SCAN["好友扫码进入"]
    FRIEND_SCAN --> FRIEND_TEST["好友完成猫咪测试"]
    FRIEND_TEST --> MATCHING["匹配计算中<br/>(双猫动画)"]

    MATCHING --> RESULT["匹配结果页"]

    subgraph RESULT_CONTENT["匹配结果"]
        R1["双猫头像并排"]
        R2["匹配度: 85%"]
        R3["关系描述:<br/>霸总猫 × 绿茶猫<br/>建议结为亲家"]
        R4["互补/冲突分析"]
    end

    RESULT --> ACTION{"用户操作"}
    ACTION -->|"分享结果"| POSTER2["生成双猫海报"]
    ACTION -->|"换一只猫匹配"| SELECT_MINE
    ACTION -->|"返回首页"| HOME["首页"]
```

### 3.6 每日猫历

```mermaid
graph TD
    OPEN["打开小程序/首页"] --> CARD["首页顶部猫历卡片<br/>(每日自动更新)"]

    subgraph CARD_CONTENT["卡片内容"]
        C1["日期 + 天气图标"]
        C2["今日运势文案<br/>如: 气压低，怂包型主子电量不足"]
        C3["🟢 宜: 躲纸箱/喂冻干"]
        C4["🔴 忌: 吸尘器/强行抱抱"]
    end

    CARD --> TAP["点击卡片"]
    TAP --> DETAIL["展开详情弹窗"]

    subgraph DETAIL_CONTENT["详情内容"]
        D1["完整运势解读"]
        D2["基于猫咪性格的个性化建议"]
        D3["今日推荐互动方式"]
        D4["历史猫历回顾入口"]
    end

    DETAIL --> ACTION{"操作"}
    ACTION -->|"分享今日猫历"| POSTER["生成猫历卡片"]
    ACTION -->|"关闭"| CARD
```

### 3.7 排行榜

```mermaid
graph TD
    ENTRY["TabBar → 排行Tab"] --> RANK_PAGE["排行榜页面"]

    RANK_PAGE --> TAB{"Tab切换"}
    TAB -->|"手速榜(默认)"| SPEED["手速排行榜"]
    TAB -->|"颜值榜"| BEAUTY["颜值排行榜"]

    subgraph SPEED_CONTENT["手速榜"]
        SP1["排名列表<br/>头像+猫名+战力值+称号"]
        SP2["我的排名(底部固定)"]
        SP3["本周/历史切换"]
    end

    subgraph BEAUTY_CONTENT["颜值榜"]
        BT1["排名列表<br/>猫咪照片+面相评分"]
        BT2["点赞功能"]
        BT3["我的排名(底部固定)"]
    end

    SPEED --> DETAIL_S["点击查看猫咪详情"]
    BEAUTY --> DETAIL_B["点击查看猫咪详情"]
    DETAIL_S --> PROFILE["猫咪档案页"]
    DETAIL_B --> PROFILE

    SPEED --> CHALLENGE["点击挑战 → 跳转爪速挑战"]
    BEAUTY --> UPLOAD["点击参赛 → 跳转AI喵相学"]
```

---

## 4. 社交裂变流程

### 4.1 分享海报生成通用流程

```mermaid
graph TD
    TRIGGER["用户点击分享按钮"] --> GENERATE["生成海报"]

    subgraph POSTER_TYPES["海报类型"]
        PT1["喵相诊断单海报"]
        PT2["喵星说明书海报(工业风)"]
        PT3["听觉雷达图海报"]
        PT4["爪速战绩海报"]
        PT5["双猫匹配海报"]
        PT6["每日猫历卡片"]
    end

    GENERATE --> PREVIEW["海报预览"]

    subgraph POSTER_ELEMENTS["海报通用元素"]
        PE1["核心结果数据"]
        PE2["猫咪头像/照片"]
        PE3["小程序码(扫码体验)"]
        PE4["品牌标识: 喵星说明书"]
    end

    PREVIEW --> CHANNEL{"分享渠道"}
    CHANNEL -->|"朋友圈"| MOMENTS["发朋友圈<br/>(图片+文案)"]
    CHANNEL -->|"微信好友"| FRIEND["发送给好友<br/>(小程序卡片)"]
    CHANNEL -->|"保存图片"| SAVE["保存到相册"]

    MOMENTS --> VIRAL["好友看到 → 扫码进入小程序"]
    FRIEND --> VIRAL
    SAVE --> VIRAL_OTHER["发到其他平台<br/>(小红书/微博)"]
```

### 4.2 双猫匹配邀请流程

```mermaid
graph TD
    USER_A["用户A: 点击双猫匹配"] --> SELECT["选择自己的猫"]
    SELECT --> GEN_INVITE["生成邀请海报<br/>(含专属二维码)"]
    GEN_INVITE --> SHARE["分享给好友B"]

    SHARE --> SCAN["好友B扫码"]
    SCAN --> ENTER["好友B进入小程序"]
    ENTER --> HAS_CAT{"好友B有猫咪档案?"}

    HAS_CAT -->|"有"| AUTO_MATCH["自动匹配"]
    HAS_CAT -->|"无"| QUICK_TEST["快速AI喵相测试"]
    QUICK_TEST --> AUTO_MATCH

    AUTO_MATCH --> RESULT_A["用户A收到匹配结果通知"]
    AUTO_MATCH --> RESULT_B["好友B看到匹配结果"]

    RESULT_A --> SHARE_RESULT_A["用户A分享结果"]
    RESULT_B --> SHARE_RESULT_B["好友B分享结果"]

    SHARE_RESULT_A --> MORE_VIRAL["更多人看到 → 裂变循环"]
    SHARE_RESULT_B --> MORE_VIRAL
```

### 4.3 排行榜炫耀流程

```mermaid
graph TD
    ACHIEVE["用户达成成就<br/>(上榜/获得称号)"] --> NOTIFY["系统通知:<br/>恭喜上榜!"]
    NOTIFY --> VIEW["查看排行榜"]
    VIEW --> HIGHLIGHT["我的排名高亮"]
    HIGHLIGHT --> SHARE{"分享?"}

    SHARE -->|"分享排名"| POSTER["生成排名海报<br/>排名+称号+战力值"]
    POSTER --> WX["分享到微信"]
    WX --> FRIEND_SEE["好友看到"]
    FRIEND_SEE --> COMPETE["好友扫码挑战"]
    COMPETE --> NEW_RANK["新的排名竞争"]
    NEW_RANK --> ACHIEVE
```

---

## 5. 页面状态矩阵

### 5.1 状态定义

| 状态 | 说明 | 视觉表现 |
|------|------|----------|
| 默认态 | 正常展示 | 完整内容 |
| 加载态 | 数据加载中 | 猫爪踩奶/猫尾摇摆动画 |
| 空态 | 无数据 | 插画+引导文案 |
| 错误态 | 请求失败 | 错误提示+重试按钮 |
| 完成态 | 操作完成 | 成功反馈+下一步引导 |
| 进行态 | 操作进行中 | 进度指示 |
| 锁定态 | 功能未解锁 | 灰色遮罩+解锁条件 |

### 5.2 各页面状态矩阵

| 页面 | 默认态 | 加载态 | 空态 | 错误态 | 完成态 | 进行态 | 锁定态 |
|------|--------|--------|------|--------|--------|--------|--------|
| 首页 | 完整展示所有模块 | 首次加载骨架屏 | - | 网络错误提示 | - | - | - |
| 每日猫历 | 今日运势卡片 | 天气数据加载中 | 未完成测试→引导测试 | 天气获取失败→通用运势 | - | - | - |
| AI喵相学 | 上传入口 | 照片上传中 | - | 上传失败→重试 | 诊断单生成 | 扫描动画进行中 | - |
| CBTI测试 | 介绍页 | - | - | - | 说明书生成 | 答题进行中(N/20) | - |
| 喵星说明书 | 完整说明书 | 结果生成中 | - | 生成失败→重试 | 已保存到档案 | - | - |
| 喵语听力 | 分类选择 | 声音加载中 | - | 声音播放失败 | 雷达图生成 | 测试进行中 | - |
| 听觉雷达图 | 完整雷达图 | 数据计算中 | - | - | 已保存 | - | - |
| 爪速挑战 | 游戏说明 | 资源加载中 | - | - | 结算页展示 | 游戏进行中 | - |
| 双猫匹配 | 选择猫咪 | 匹配计算中 | 无猫咪档案→引导测试 | 匹配失败 | 匹配结果 | 等待好友扫码 | - |
| 档案 | 猫咪列表+记录 | 数据加载中 | 无猫咪→引导添加 | 加载失败 | - | - | - |
| 排行-手速榜 | 排名列表 | 数据加载中 | 本周无数据 | 加载失败 | - | - | 未生成说明书→不可上榜 |
| 颜值榜 | 排名列表 | 数据加载中 | 本周无数据 | 加载失败 | - | - | 未生成说明书→不可上榜 |
| 我的 | 用户信息+设置 | 数据加载中 | 未登录→引导授权 | 加载失败 | - | - | - |

### 5.3 关键状态流转

```mermaid
stateDiagram-v2
    [*] --> 默认态

    默认态 --> 加载态: 触发操作
    加载态 --> 默认态: 加载成功
    加载态 --> 错误态: 加载失败
    错误态 --> 加载态: 点击重试
    默认态 --> 进行态: 开始操作(答题/游戏/测试)
    进行态 --> 完成态: 操作完成
    完成态 --> 默认态: 返回/重新开始

    默认态 --> 空态: 无数据
    空态 --> 默认态: 完成引导操作后
    锁定态 --> 默认态: 满足解锁条件
```

---

## 6. 异常与边界流程

### 6.1 网络异常处理

```mermaid
graph TD
    ACTION["用户操作"] --> REQUEST["发起请求"]
    REQUEST --> NET_CHECK{"网络状态"}
    NET_CHECK -->|"正常"| SUCCESS["正常响应"]
    NET_CHECK -->|"弱网"| TIMEOUT["超时处理<br/>展示加载动画"]
    NET_CHECK -->|"断网"| OFFLINE["离线提示<br/>猫咪睡觉插画"]

    TIMEOUT --> RETRY_AUTO["自动重试(3次)"]
    RETRY_AUTO -->|"成功"| SUCCESS
    RETRY_AUTO -->|"失败"| ERROR["错误页<br/>手动重试按钮"]

    OFFLINE --> CACHE{"有本地缓存?"}
    CACHE -->|"有"| SHOW_CACHE["展示缓存数据<br/>+离线标识"]
    CACHE -->|"无"| ERROR
    ERROR --> RETRY["点击重试"] --> REQUEST
```

### 6.2 权限拒绝处理

```mermaid
graph TD
    NEED_PERM["需要权限<br/>(相机/相册/位置)"] --> ASK["系统权限弹窗"]
    ASK -->|"允许"| PROCEED["正常流程"]
    ASK -->|"拒绝"| GUIDE["引导页:<br/>需要XX权限才能使用此功能"]
    GUIDE --> SETTING["引导去系统设置开启"]
    GUIDE --> ALT["提供替代方案<br/>(如: 手动输入代替拍照)"]
```

---

*文档版本: v1.0 | 基于 PRD v1.0 | 页面清单: 13个页面*



