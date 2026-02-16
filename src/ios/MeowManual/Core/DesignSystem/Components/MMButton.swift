import SwiftUI

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
        .buttonStyle(PressableButtonStyle())
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .primary:
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient.coral)
                .shadow(color: Color.coralPrimary.opacity(0.3), radius: 12, y: 4)
        case .secondary:
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.bgPure)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.grayTertiary, lineWidth: 1)
                )
        case .dark:
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.accentOrange)
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .primary, .dark: return .white
        case .secondary: return .inkBlack
        }
    }
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
