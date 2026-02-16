import SwiftUI

// MARK: - Brand Colors
extension Color {
    static let coralPrimary = Color(red: 1.0, green: 0.48, blue: 0.31)
    static let coralSecondary = Color(red: 1.0, green: 0.42, blue: 0.42)
    static let coralGradientStart = Color(red: 1.0, green: 0.54, blue: 0.40)
    static let coralGradientEnd = Color(red: 1.0, green: 0.42, blue: 0.42)
    
    static let accentOrange = Color(red: 0.98, green: 0.45, blue: 0.09)
    static let accentYellow = Color(red: 0.98, green: 0.75, blue: 0.14)
    static let champagneGold = Color(red: 1.0, green: 0.82, blue: 0.40)
    static let successGreen = Color(red: 0.20, green: 0.78, blue: 0.35)
    static let dangerRed = Color(red: 1.0, green: 0.27, blue: 0.23)
    
    static let inkBlack = Color(red: 0.10, green: 0.10, blue: 0.10)
    static let textPrimary = Color(red: 0.18, green: 0.18, blue: 0.18)
    static let textSecondary = Color(red: 0.47, green: 0.44, blue: 0.42)
    static let textTertiary = Color(red: 0.56, green: 0.56, blue: 0.58)
    static let grayPrimary = Color(red: 0.42, green: 0.45, blue: 0.50)
    static let graySecondary = Color(red: 0.61, green: 0.64, blue: 0.69)
    static let grayTertiary = Color(red: 0.82, green: 0.84, blue: 0.86)
    
    static let bgCream = Color(red: 0.98, green: 0.98, blue: 0.97)
    static let bgPure = Color.white
    static let bgGray = Color(red: 0.96, green: 0.96, blue: 0.97)
    static let bgSurface = Color(red: 0.91, green: 0.90, blue: 0.89)
    
    static let bgDeep = Color(red: 0.05, green: 0.05, blue: 0.06)
    static let bgDark = Color(red: 0.11, green: 0.11, blue: 0.12)
    static let bgElevatedDark = Color(red: 0.17, green: 0.17, blue: 0.18)
}

// MARK: - Gradients
extension LinearGradient {
    static let coral = LinearGradient(
        colors: [.coralGradientStart, .coralGradientEnd],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let darkCard = LinearGradient(
        colors: [Color(red: 0.11, green: 0.11, blue: 0.12), 
                 Color(red: 0.15, green: 0.15, blue: 0.16)],
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let purple = LinearGradient(
        colors: [Color(red: 0.61, green: 0.49, blue: 1.0),
                 Color(red: 0.49, green: 0.36, blue: 0.88)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let amber = LinearGradient(
        colors: [Color(red: 1.0, green: 0.72, blue: 0.30),
                 Color(red: 1.0, green: 0.62, blue: 0.11)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
