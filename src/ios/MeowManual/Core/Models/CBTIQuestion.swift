import Foundation

struct CBTIQuestion: Identifiable {
    let id: Int
    let question: String
    let options: [CBTIOption]
    let dimension: CBTIDimension
}

struct CBTIOption: Identifiable {
    let id = UUID()
    let label: String
    let text: String
    let score: Int
}

enum CBTIDimension: String, CaseIterable {
    case clingy = "粘人度"
    case activity = "活泼度"
    case curiosity = "好奇心"
    case gentleness = "温顺度"
}
