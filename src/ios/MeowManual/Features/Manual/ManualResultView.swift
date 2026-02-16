import SwiftUI

struct ManualResultView: View {
    let catName = "橘子"
    let cbtiType = "怂包型"
    let cbtiEmoji = "😰"
    
    let traits = [
        (name: "粘人度", value: 0.85, color: Color.coralPrimary),
        (name: "攻击力", value: 0.10, color: Color.dangerRed),
        (name: "智商", value: 0.72, color: Color.accentYellow)
    ]
    
    let tags = ["听觉过滤", "选择性失聪", "美食雷达", "纸箱爱好者", "社恐晚期"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                headerSection
                catProfileSection
                traitsSection
                tagsSection
                adviceSection
                bottomButtons
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
        }
        .background(Color.bgDeep.ignoresSafeArea())
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("📖 喵星说明书")
                .font(.displayMedium)
                .foregroundColor(.white)
            
            Text("基于CBTI性格测试生成")
                .font(.bodyMedium)
                .foregroundColor(.white.opacity(0.6))
        }
        .padding(.top, 8)
    }
    
    private var catProfileSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(LinearGradient.coral)
                    .frame(width: 100, height: 100)
                
                Text(cbtiEmoji)
                    .font(.system(size: 56))
            }
            
            Text(catName)
                .font(.headlineMedium)
                .foregroundColor(.white)
            
            Text(cbtiType)
                .font(.scoreDisplay)
                .foregroundColor(Color.champagneGold)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.champagneGold.opacity(0.15))
                )
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient.darkCard)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.champagneGold.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    private var traitsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("性格特征")
                .font(.headlineSmall)
                .foregroundColor(.white)
            
            VStack(spacing: 16) {
                ForEach(traits, id: \.name) { trait in
                    TraitBar(name: trait.name, value: trait.value, color: trait.color)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient.darkCard)
        )
    }
    
    private var tagsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("核心性格标签")
                .font(.headlineSmall)
                .foregroundColor(.white)
            
            FlowLayout(spacing: 8) {
                ForEach(tags, id: \.self) { tag in
                    TagView(text: tag)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient.darkCard)
        )
    }
    
    private var adviceSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("💡 相处建议")
                .font(.headlineSmall)
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 12) {
                AdviceRow(icon: "✅", text: "多准备纸箱和隐藏空间")
                AdviceRow(icon: "✅", text: "避免突然的大声噪音")
                AdviceRow(icon: "⚠️", text: "不要强迫社交互动")
                AdviceRow(icon: "🎯", text: "用美食建立信任关系")
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient.darkCard)
        )
    }
    
    private var bottomButtons: some View {
        VStack(spacing: 12) {
            Button(action: {}) {
                Text("保存说明书")
                    .font(.bodyLarge.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(LinearGradient.coral)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.coralPrimary.opacity(0.3), radius: 12, y: 4)
            }
            
            NavigationLink(destination: MatchView()) {
                Text("邀请朋友测缘分")
                    .font(.bodyLarge.weight(.medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                    )
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.bgDeep)
    }
}

struct TraitBar: View {
    let name: String
    let value: Double
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Text(name)
                .font(.bodyMedium)
                .foregroundColor(.white.opacity(0.8))
                .frame(width: 60, alignment: .leading)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(color)
                        .frame(width: geometry.size.width * value, height: 8)
                }
            }
            .frame(height: 8)
            
            Text("\(Int(value * 100))%")
                .font(.captionMedium.weight(.semibold))
                .foregroundColor(color)
                .frame(width: 40, alignment: .trailing)
        }
    }
}

struct TagView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.captionMedium.weight(.medium))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.champagneGold.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.champagneGold.opacity(0.4), lineWidth: 1)
                    )
            )
    }
}

struct AdviceRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text(icon)
                .font(.bodyMedium)
            
            Text(text)
                .font(.bodyMedium)
                .foregroundColor(.white.opacity(0.9))
        }
    }
}


