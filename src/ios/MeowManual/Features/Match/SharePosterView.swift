import SwiftUI

struct SharePosterView: View {
    var body: some View {
        ZStack {
            Color.bgDeep.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    posterCard
                    actionButtons
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
        }
    }
    
    private var posterCard: some View {
        VStack(spacing: 20) {
            posterHeader
            catImageSection
            tagsSection
            statsSection
            qrSection
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient.darkCard)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
    
    private var posterHeader: some View {
        VStack(spacing: 8) {
            Text("🐱 喵星说明书")
                .font(.headlineMedium)
                .foregroundColor(.white)
            
            Text("橘子")
                .font(.displayMedium)
                .foregroundColor(.white)
        }
    }
    
    private var catImageSection: some View {
        ZStack {
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [.coralGradientStart, .coralGradientEnd],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 4
                )
                .frame(width: 140, height: 140)
            
            Text("🐱")
                .font(.system(size: 80))
        }
    }
    
    private var tagsSection: some View {
        FlowLayout(spacing: 8) {
            PosterTag(text: "E型社牛猫")
            PosterTag(text: "干饭机器")
            PosterTag(text: "易胖体质")
        }
    }
    
    private var statsSection: some View {
        HStack(spacing: 20) {
            PosterStat(label: "粘人度", value: "80%")
            PosterStat(label: "攻击力", value: "10%")
            PosterStat(label: "智商", value: "???")
        }
    }
    
    private var qrSection: some View {
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "qrcode")
                        .font(.system(size: 40))
                        .foregroundColor(.textPrimary)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text("扫码测测你家猫")
                    .font(.bodyMedium.weight(.semibold))
                    .foregroundColor(.white)
                
                Text("喵星说明书 - 科学破译猫咪性格")
                    .font(.captionSmall)
                    .foregroundColor(.white.opacity(0.6))
            }
            
            Spacer()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white.opacity(0.1))
        )
    }
    
    private var actionButtons: some View {
        HStack(spacing: 12) {
            Button(action: {}) {
                HStack {
                    Image(systemName: "square.and.arrow.down")
                    Text("保存")
                }
                .font(.bodyMedium.weight(.semibold))
                .foregroundColor(.textPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.bgGray)
                )
            }

            Button(action: {
                // 分享功能 - 实际项目中会调用系统分享
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("分享")
                }
                .font(.bodyMedium.weight(.semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient.coral)
                )
            }
        }
    }
}

struct PosterTag: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.captionMedium.weight(.medium))
            .foregroundColor(Color.champagneGold)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.champagneGold.opacity(0.15))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.champagneGold.opacity(0.3), lineWidth: 1)
            )
    }
}

struct PosterStat: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.captionSmall)
                .foregroundColor(.white.opacity(0.6))
            
            Text(value)
                .font(.bodyLarge.weight(.bold))
                .foregroundColor(.accentOrange)
        }
        .frame(maxWidth: .infinity)
    }
}
