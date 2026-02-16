import SwiftUI

struct MatchView: View {
    var body: some View {
        ZStack {
            Color.bgCream.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    catsSection
                    matchResultCard
                    personalityChart
                    inviteCard
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
    }
    
    private var catsSection: some View {
        HStack(spacing: 20) {
            CatAvatar(name: "橘子", emoji: "🐱", type: "霸总猫", isMine: true)
            
            VStack(spacing: 4) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 32))
                    .foregroundColor(Color.coralPrimary)
                
                Text("85%")
                    .font(.scoreDisplay)
                    .foregroundColor(Color.coralPrimary)
                
                Text("缘分匹配度")
                    .font(.captionMedium)
                    .foregroundColor(.grayPrimary)
            }
            
            CatAvatar(name: "奶茶", emoji: "🧋", type: "绿茶猫", isMine: false)
        }
        .padding(.top, 8)
    }
    
    private var matchResultCard: some View {
        VStack(spacing: 16) {
            Text("匹配结果")
                .font(.headlineSmall)
                .foregroundColor(.textPrimary)
            
            Text("霸道总裁遇到绿茶，火花四溅！一个愿意宠，一个会撒娇，天生一对。")
                .font(.bodyMedium)
                .foregroundColor(.textSecondary)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 12) {
                IndexCard(title: "主动指数", value: "92%", icon: "bolt.fill", isDark: true)
                IndexCard(title: "撒娇指数", value: "88%", icon: "heart.fill", isDark: false)
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
        )
    }
    
    private var personalityChart: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("性格互补度")
                .font(.headlineSmall)
                .foregroundColor(.textPrimary)
            
            VStack(spacing: 12) {
                ComparisonBar(label: "粘人", value1: 0.8, value2: 0.3)
                ComparisonBar(label: "活泼", value1: 0.6, value2: 0.9)
                ComparisonBar(label: "好奇", value1: 0.7, value2: 0.5)
                ComparisonBar(label: "温顺", value1: 0.4, value2: 0.8)
            }
            
            HStack(spacing: 16) {
                HStack(spacing: 8) {
                    Circle().fill(Color.coralPrimary).frame(width: 8, height: 8)
                    Text("霸总猫")
                        .font(.captionSmall)
                        .foregroundColor(.grayPrimary)
                }
                
                HStack(spacing: 8) {
                    Circle().fill(Color.champagneGold).frame(width: 8, height: 8)
                    Text("绿茶猫")
                        .font(.captionSmall)
                        .foregroundColor(.grayPrimary)
                }
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
        )
    }
    
    private var inviteCard: some View {
        NavigationLink(destination: MatchInviteView()) {
            VStack(spacing: 12) {
                Text("邀请更多铲屎官来测")
                    .font(.bodyLarge.weight(.semibold))
                    .foregroundColor(.textPrimary)
                
                Text("生成专属海报，看看谁家的猫最配")
                    .font(.bodySmall)
                    .foregroundColor(.grayPrimary)
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.bgPure)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.grayTertiary, lineWidth: 1)
                    )
            )
        }
    }
}

struct CatAvatar: View {
    let name: String
    let emoji: String
    let type: String
    let isMine: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Text(emoji)
                .font(.system(size: 56))
                .frame(width: 88, height: 88)
                .background(
                    Group {
                        if isMine {
                            Circle()
                                .fill(LinearGradient.coral)
                        } else {
                            Circle()
                                .fill(Color.bgGray)
                        }
                    }
                )
                .overlay(
                    Group {
                        if isMine {
                            Circle()
                                .stroke(Color.clear, lineWidth: 2)
                        } else {
                            Circle()
                                .stroke(Color.grayTertiary, style: StrokeStyle(lineWidth: 2, dash: [5]))
                        }
                    }
                )
            
            Text(name)
                .font(.bodyMedium.weight(.semibold))
                .foregroundColor(.textPrimary)
            
            Text(type)
                .font(.captionSmall)
                .foregroundColor(Color.coralPrimary)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.coralPrimary.opacity(0.1))
                )
        }
    }
}

struct IndexCard: View {
    let title: String
    let value: String
    let icon: String
    let isDark: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.captionMedium)
                .foregroundColor(isDark ? .champagneGold : .coralPrimary)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.captionSmall)
                    .foregroundColor(isDark ? .white.opacity(0.7) : Color.grayPrimary)
                
                Text(value)
                    .font(.bodyLarge.weight(.bold))
                    .foregroundColor(isDark ? .white : .textPrimary)
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Group {
                if isDark {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient.darkCard)
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.bgGray)
                }
            }
        )
    }
}

struct ComparisonBar: View {
    let label: String
    let value1: Double
    let value2: Double
    
    var body: some View {
        HStack(spacing: 12) {
            Text(label)
                .font(.captionMedium)
                .foregroundColor(.grayPrimary)
                .frame(width: 40)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.bgGray)
                        .frame(height: 8)
                    
                    HStack(spacing: 2) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.coralPrimary)
                            .frame(width: geometry.size.width * value1 * 0.5, height: 8)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.champagneGold)
                            .frame(width: geometry.size.width * value2 * 0.5, height: 8)
                    }
                }
            }
            .frame(height: 8)
        }
    }
}
