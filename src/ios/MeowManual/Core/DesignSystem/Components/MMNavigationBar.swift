import SwiftUI

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
                        .background(Color.bgGray)
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
            
            Color.clear.frame(width: 40, height: 40)
        }
        .padding(.horizontal, DesignSystem.pagePadding)
        .frame(height: 56)
    }
}
