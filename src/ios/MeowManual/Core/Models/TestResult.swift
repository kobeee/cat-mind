import Foundation

struct TestResult {
    let id = UUID()
    let type: TestType
    let score: Int
    let rank: String
    let title: String
    let description: String
    let createdAt: Date
    
    enum TestType {
        case face, cbti, hearing, paw
    }
}

struct ManualData {
    let modelName: String
    let modelCode: String
    let faceScore: Int
    let quote: String
    let specs: [SpecItem]
    let guides: [GuideItem]
    
    struct SpecItem {
        let label: String
        let value: String
        let percentage: Double
    }
    
    struct GuideItem {
        let isGood: Bool
        let items: [String]
    }
}
