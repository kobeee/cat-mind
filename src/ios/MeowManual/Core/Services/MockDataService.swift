import Foundation

enum MockData {
    static let dailyCalendar = DailyCalendar(
        date: formatDate(),
        weather: "🌧️ 雨天 · 气压低",
        description: "您的【怂包型】主子可能电量不足",
        goodThings: ["躲在纸箱里", "喂冻干"],
        badThings: ["吸尘器", "强行抱抱"]
    )
    
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
        CBTIQuestion(
            id: 2,
            question: "当你拿出零食袋时，主子会？",
            options: [
                CBTIOption(label: "A", text: "瞬间闪现到脚边", score: 5),
                CBTIOption(label: "B", text: "慢悠悠走过来", score: 3),
                CBTIOption(label: "C", text: "假装不在意", score: 2)
            ],
            dimension: .curiosity
        ),
        CBTIQuestion(
            id: 3,
            question: "晚上睡觉时，主子喜欢？",
            options: [
                CBTIOption(label: "A", text: "贴着你睡", score: 5),
                CBTIOption(label: "B", text: "睡床尾", score: 3),
                CBTIOption(label: "C", text: "自己找地方睡", score: 1)
            ],
            dimension: .clingy
        ),
        CBTIQuestion(
            id: 4,
            question: "遇到陌生猫咪时，主子的反应是？",
            options: [
                CBTIOption(label: "A", text: "友好地蹭蹭", score: 5),
                CBTIOption(label: "B", text: "保持警惕", score: 3),
                CBTIOption(label: "C", text: "哈气警告", score: 1)
            ],
            dimension: .gentleness
        ),
        CBTIQuestion(
            id: 5,
            question: "玩耍时，主子更喜欢？",
            options: [
                CBTIOption(label: "A", text: "追着激光笔疯跑", score: 5),
                CBTIOption(label: "B", text: "偶尔扑一下", score: 3),
                CBTIOption(label: "C", text: "看你玩", score: 1)
            ],
            dimension: .activity
        )
    ]
    
    static let speedRankings = [
        RankingItem(rank: 1, name: "闪电", emoji: "⚡️", score: 999, type: "无影爪宗师"),
        RankingItem(rank: 2, name: "小橘", emoji: "🍊", score: 856, type: "快爪手"),
        RankingItem(rank: 3, name: "奶茶", emoji: "🧋", score: 743, type: "灵活猫"),
        RankingItem(rank: 4, name: "团子", emoji: "🍡", score: 621, type: "普通猫"),
        RankingItem(rank: 5, name: "煤球", emoji: "⚫️", score: 534, type: "慵懒型")
    ]
    
    static let beautyRankings = [
        RankingItem(rank: 1, name: " princess", emoji: "👑", score: 98, type: "盛世美颜"),
        RankingItem(rank: 2, name: "雪球", emoji: "❄️", score: 95, type: "冰雪美人"),
        RankingItem(rank: 3, name: "花花", emoji: "🌸", score: 92, type: "花见花开")
    ]
    
    static let archiveRecords = [
        ArchiveRecord(type: .face, title: "面相识别", desc: "98分 · 旺家相", date: "今天"),
        ArchiveRecord(type: .cbti, title: "CBTI测试", desc: "E型社牛猫", date: "昨天"),
        ArchiveRecord(type: .hearing, title: "听力测试", desc: "听觉过滤系统开启", date: "3天前")
    ]
    
    private static func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.dateFormat = "M月d日 E"
        return formatter.string(from: Date())
    }
}

struct DailyCalendar {
    let date: String
    let weather: String
    let description: String
    let goodThings: [String]
    let badThings: [String]
}

struct RankingItem: Identifiable {
    let id = UUID()
    let rank: Int
    let name: String
    let emoji: String
    let score: Int
    let type: String
}

struct ArchiveRecord: Identifiable {
    let id = UUID()
    let type: TestType
    let title: String
    let desc: String
    let date: String
    
    enum TestType {
        case face, cbti, hearing, paw
        
        var icon: String {
            switch self {
            case .face: return "face.smiling"
            case .cbti: return "doc.text"
            case .hearing: return "ear"
            case .paw: return "hand.tap"
            }
        }
    }
}
