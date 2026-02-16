import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgCream.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        headerSection
                        DailyCalendarCard()
                        featureGridSection
                        morePlaySection
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 120)
                }
            }
        }
    }
    
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("喵星说明书")
                    .font(.displayLarge)
                    .foregroundColor(.inkBlack)
                
                Text("科学破译你家主子的出厂设置")
                    .font(.captionLarge)
                    .foregroundColor(.grayPrimary)
            }
            
            Spacer()
            
            Circle()
                .fill(Color.bgPure)
                .frame(width: 44, height: 44)
                .shadow(color: .black.opacity(0.05), radius: 10, y: 3)
                .overlay(
                    Circle()
                        .stroke(Color.grayTertiary, lineWidth: 1)
                )
        }
        .padding(.top, 8)
    }
    
    private var featureGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("探索功能")
                .font(.headlineMedium)
                .foregroundColor(.inkBlack)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                NavigationLink(destination: AIFaceView()) {
                    FeatureCard(
                        title: "AI喵相学",
                        subtitle: "面相速测",
                        icon: "face.smiling.fill",
                        colors: [.coralGradientStart, .coralGradientEnd]
                    )
                }
                
                NavigationLink(destination: CBTITestView()) {
                    FeatureCard(
                        title: "CBTI测试",
                        subtitle: "性格深度分析",
                        icon: "doc.text.fill",
                        colors: [.coralGradientStart, .coralGradientEnd],
                        isGradient: true
                    )
                }
                
                NavigationLink(destination: HearingTestView()) {
                    FeatureCard(
                        title: "喵语听力",
                        subtitle: "听觉敏感度测试",
                        icon: "ear.fill",
                        colors: [Color(red: 0.61, green: 0.49, blue: 1.0),
                                 Color(red: 0.49, green: 0.36, blue: 0.88)]
                    )
                }
                
                NavigationLink(destination: PawReadyView()) {
                    FeatureCard(
                        title: "爪速挑战",
                        subtitle: "反应速度测试",
                        icon: "bolt.fill",
                        colors: [Color(red: 1.0, green: 0.72, blue: 0.30),
                                 Color(red: 1.0, green: 0.62, blue: 0.11)]
                    )
                }
            }
        }
    }
    
    private var morePlaySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("更多玩法")
                .font(.captionLarge)
                .foregroundColor(.grayPrimary)
            
            HStack {
                NavigationLink(destination: MatchView()) {
                    SmallFeatureCard(
                        title: "双猫匹配",
                        subtitle: "测测缘分",
                        icon: "heart.fill",
                        color: .coralSecondary
                    )
                }
                Spacer()
            }
        }
    }
}

struct DailyCalendarCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("📅 今日猫历")
                    .font(.captionMedium.weight(.bold))
                    .foregroundColor(Color.champagneGold)
                
                Spacer()
                
                Text("2月15日 周六")
                    .font(.captionSmall)
                    .foregroundColor(.white.opacity(0.55))
            }
            
            HStack(spacing: 8) {
                Text("🌧️ 雨天 · 气压低")
                    .font(.bodySmall.weight(.semibold))
                    .foregroundColor(.white.opacity(0.9))
            }
            
            Text("您的【怂包型】主子可能电量不足")
                .font(.headlineMedium)
                .foregroundColor(.white)
            
            VStack(spacing: 10) {
                GoodBadRow(isGood: true, items: ["躲在纸箱里", "喂冻干"])
                GoodBadRow(isGood: false, items: ["吸尘器", "强行抱抱"])
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(
                    colors: [Color(red: 0.11, green: 0.11, blue: 0.12),
                             Color(red: 0.15, green: 0.15, blue: 0.16),
                             Color(red: 0.12, green: 0.12, blue: 0.13),
                             Color(red: 0.16, green: 0.16, blue: 0.17)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
        )
    }
}

struct GoodBadRow: View {
    let isGood: Bool
    let items: [String]
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(LinearGradient(
                    colors: [Color.white, Color(red: 0.94, green: 0.94, blue: 0.94)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 32, height: 32)
                .shadow(color: isGood ? Color(red: 0.19, green: 0.82, blue: 0.35).opacity(0.25) : Color(red: 1.0, green: 0.27, blue: 0.23).opacity(0.25),
                        radius: 6, y: 2)
                .overlay(
                    Text(isGood ? "宜" : "忌")
                        .font(.captionMedium.weight(.heavy))
                        .foregroundColor(isGood ? Color(red: 0.19, green: 0.82, blue: 0.35) : Color(red: 1.0, green: 0.27, blue: 0.23))
                )
            
            Text(items.joined(separator: "、"))
                .font(.bodySmall.weight(.semibold))
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isGood ?
                    LinearGradient(colors: [Color(red: 0.19, green: 0.82, blue: 0.35),
                                           Color(red: 0.16, green: 0.69, blue: 0.28),
                                           Color(red: 0.18, green: 0.69, blue: 0.31)],
                                 startPoint: .leading, endPoint: .trailing) :
                    LinearGradient(colors: [Color(red: 1.0, green: 0.27, blue: 0.23),
                                           Color(red: 0.90, green: 0.24, blue: 0.20),
                                           Color(red: 0.85, green: 0.18, blue: 0.18)],
                                 startPoint: .leading, endPoint: .trailing)
                )
                .shadow(color: isGood ? Color(red: 0.19, green: 0.82, blue: 0.35).opacity(0.15) : Color(red: 1.0, green: 0.27, blue: 0.23).opacity(0.15),
                        radius: 12, y: 4)
        )
    }
}

struct FeatureCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let colors: [Color]
    var isGradient: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                Group {
                    if isGradient {
                        Circle()
                            .fill(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                    } else {
                        Circle()
                            .fill(Color.clear)
                    }
                }
                    .frame(width: 44, height: 44)
                    .background(
                        Group {
                            if !isGradient {
                                LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
                            }
                        }
                        .clipShape(Circle())
                    )
                
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(isGradient ? .coralPrimary : Color.white)
            }
            
            Text(title)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(isGradient ? .white : .textPrimary)
            
            Text(subtitle)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(isGradient ? .white.opacity(0.85) : Color.grayPrimary)
        }
        .padding(20)
        .frame(width: 169, height: 150, alignment: .leading)
        .background(
            Group {
                if isGradient {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(color: colors[0].opacity(0.25), radius: 18, y: 6)
                } else {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.bgPure)
                        .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
                }
            }
        )
    }
}

struct SmallFeatureCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
            
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.textPrimary)
            
            Text(subtitle)
                .font(.system(size: 11))
                .foregroundColor(.grayPrimary)
        }
        .padding(10)
        .frame(width: 120, height: 100)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.bgPure)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.grayTertiary, lineWidth: 1)
                )
        )
    }
}
