import SwiftUI

struct HearingTestView: View {
    @State private var selectedCategory = 0
    @State private var showingReactionModal = false
    @State private var selectedSound: SoundItem?
    @State private var completedTests = 0
    @State private var showResult = false
    
    let totalTests = 4
    let categories = ["召唤系", "挑衅系", "猎奇系"]
    
    let sounds = [
        SoundItem(name: "开罐头", desc: "干饭召唤", icon: "can.fill", color: .coralPrimary),
        SoundItem(name: "摇猫粮", desc: "零食诱惑", icon: "bag.fill", color: .coralSecondary),
        SoundItem(name: "同类打架", desc: "领地警示", icon: "exclamationmark.triangle.fill", color: .dangerRed),
        SoundItem(name: "哈气声", desc: "威胁警告", icon: "speaker.wave.3.fill", color: .accentOrange)
    ]
    
    var body: some View {
        ZStack {
            Color.bgCream.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    headerSection
                    categoryTabs
                    soundGrid
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
            
            if showingReactionModal {
                ReactionModal(isShowing: $showingReactionModal) {
                    completedTests += 1
                    if completedTests >= totalTests {
                        showResult = true
                    }
                }
                .transition(.move(edge: .bottom))
            }
        }
        .navigationDestination(isPresented: $showResult) {
            HearingRadarView()
        }
        .navigationTitle("喵语听力统考")
    }
    
    private var headerSection: some View {
        VStack(spacing: 6) {
            Text("🎧 听力测试")
                .font(.displayMedium)
                .foregroundColor(.inkBlack)
            
            Text("播放声音，观察主子反应，测试听觉敏感度")
                .font(.bodyMedium)
                .foregroundColor(.grayPrimary)
                .multilineTextAlignment(.center)
            
            if completedTests > 0 {
                HStack(spacing: 8) {
                    Text("已完成 \(completedTests)/\(totalTests) 项测试")
                        .font(.captionMedium)
                        .foregroundColor(Color.coralPrimary)
                    
                    if completedTests >= totalTests {
                        NavigationLink(destination: HearingRadarView()) {
                            Text("查看结果 →")
                                .font(.captionMedium.weight(.semibold))
                                .foregroundColor(Color.coralPrimary)
                        }
                    }
                }
                .padding(.top, 8)
            }
        }
    }
    
    private func categoryIcon(for index: Int) -> String {
        if index == 0 { return "speaker.wave.2.fill" }
        if index == 1 { return "bolt.fill" }
        return "eye.fill"
    }
    
    private var categoryTabs: some View {
        HStack(spacing: 8) {
            ForEach(0..<categories.count, id: \.self) { index in
                let iconName = categoryIcon(for: index)
                Button(action: { selectedCategory = index }) {
                    HStack(spacing: 6) {
                        Image(systemName: iconName)
                            .font(.captionMedium)
                        Text(categories[index])
                            .font(.captionMedium.weight(selectedCategory == index ? .semibold : .medium))
                    }
                    .foregroundColor(selectedCategory == index ? Color.white : Color.grayPrimary)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        Group {
                            if selectedCategory == index {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(LinearGradient.coral)
                            } else {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.clear)
                            }
                        }
                    )
                }
            }
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.bgSurface)
        )
    }
    
    private var soundGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            ForEach(sounds) { sound in
                SoundCard(sound: sound) {
                    selectedSound = sound
                    showingReactionModal = true
                }
            }
        }
    }
}

struct SoundItem: Identifiable {
    let id = UUID()
    let name: String
    let desc: String
    let icon: String
    let color: Color
}

struct SoundCard: View {
    let sound: SoundItem
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Image(systemName: sound.icon)
                        .font(.system(size: 24))
                        .foregroundColor(Color.coralPrimary)
                    
                    Text(sound.name)
                        .font(.bodyMedium.weight(.semibold))
                        .foregroundColor(.textPrimary)
                    
                    Text(sound.desc)
                        .font(.captionSmall)
                        .foregroundColor(.grayPrimary)
                }
                
                Spacer()
                
                Circle()
                    .fill(Color.bgGray)
                    .frame(width: 32, height: 32)
                    .overlay(
                        Image(systemName: "play.fill")
                            .font(.captionMedium)
                            .foregroundColor(Color.coralPrimary)
                    )
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.bgPure)
                    .shadow(color: .black.opacity(0.06), radius: 8, y: 2)
            )
        }
    }
}

struct ReactionModal: View {
    @Binding var isShowing: Bool
    let onComplete: () -> Void
    
    let reactions = [
        (emoji: "✈️", text: "飞机耳", desc: "耳朵向后贴"),
        (emoji: "😾", text: "炸毛", desc: "毛发竖起"),
        (emoji: "😴", text: "无视", desc: "毫无反应")
    ]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture { isShowing = false }
            
            VStack(spacing: 20) {
                Text("主子反应如何？")
                    .font(.headlineSmall)
                    .foregroundColor(.inkBlack)
                
                Text("观察猫咪听到声音后的反应")
                    .font(.bodySmall)
                    .foregroundColor(.grayPrimary)
                
                VStack(spacing: 12) {
                    ForEach(reactions, id: \.text) { reaction in
                        ReactionButton(
                            emoji: reaction.emoji,
                            text: reaction.text,
                            desc: reaction.desc
                        ) {
                            isShowing = false
                            onComplete()
                        }
                    }
                }
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.bgPure)
            )
            .padding(.horizontal, 40)
        }
    }
}

struct ReactionButton: View {
    let emoji: String
    let text: String
    let desc: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Text(emoji)
                    .font(.system(size: 32))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(text)
                        .font(.bodyMedium.weight(.semibold))
                        .foregroundColor(.textPrimary)
                    
                    Text(desc)
                        .font(.captionSmall)
                        .foregroundColor(.grayPrimary)
                }
                
                Spacer()
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.bgGray)
            )
        }
    }
}
