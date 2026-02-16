import SwiftUI

extension Font {
    static let displayLarge = Font.system(size: 42, weight: .heavy, design: .rounded)
    static let displayMedium = Font.system(size: 30, weight: .bold, design: .rounded)
    
    static let headlineLarge = Font.system(size: 28, weight: .bold)
    static let headlineMedium = Font.system(size: 22, weight: .semibold)
    static let headlineSmall = Font.system(size: 18, weight: .semibold)
    
    static let bodyLarge = Font.system(size: 17, weight: .regular)
    static let bodyMedium = Font.system(size: 16, weight: .regular)
    static let bodySmall = Font.system(size: 15, weight: .regular)
    
    static let captionLarge = Font.system(size: 14, weight: .medium)
    static let captionMedium = Font.system(size: 13, weight: .medium)
    static let captionSmall = Font.system(size: 12, weight: .regular)
    static let captionTiny = Font.system(size: 11, weight: .medium)
    
    static let scoreDisplay = Font.system(size: 48, weight: .bold, design: .rounded)
    static let comboDisplay = Font.system(size: 64, weight: .black, design: .rounded)
}
