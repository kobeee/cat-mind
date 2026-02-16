import Foundation
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
