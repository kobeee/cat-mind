import SwiftUI

struct PawReadyView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 32) {
                targetDemo
                rulesSection
                startButton
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 40)
        }
        .background(Color.bgDeep.ignoresSafeArea())
        .navigationTitle("爪速大挑战")
    }
    
    private var navigationBar: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "arrow.backward")
                    .font(.bodyLarge.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(.white.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Spacer()
            
            Text("爪速大挑战")
                .font(.headlineSmall)
                .foregroundColor(.white)
            
            Spacer()
            
            Color.clear.frame(width: 40, height: 40)
        }
        .padding(.horizontal, 20)
        .frame(height: 56)
    }
    
    private var targetDemo: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 80, height: 80)
                    .shadow(color: .red.opacity(0.5), radius: 20)
                
                Image(systemName: "hand.tap.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("点击红色目标")
                .font(.headlineMedium)
                .foregroundColor(.white)
            
            Text("目标会随机出现，快速点击！")
                .font(.bodyMedium)
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(40)
    }
    
    private var rulesSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("游戏规则")
                .font(.headlineSmall)
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 16) {
                RuleRow(number: "1", text: "倒计时 30 秒，目标随机出现")
                RuleRow(number: "2", text: "每击中一个目标 +10 分")
                RuleRow(number: "3", text: "连续击中可获得连击加成")
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient.darkCard)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
    
    private var startButton: some View {
        NavigationLink(destination: PawGameView()) {
            Text("开始挑战")
                .font(.bodyLarge.weight(.bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.accentOrange)
                )
                .shadow(color: .accentOrange.opacity(0.4), radius: 16, y: 6)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
}

struct RuleRow: View {
    let number: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Text(number)
                .font(.bodyMedium.weight(.bold))
                .foregroundColor(.accentOrange)
                .frame(width: 28, height: 28)
                .background(
                    Circle()
                        .fill(Color.accentOrange.opacity(0.2))
                )
            
            Text(text)
                .font(.bodyMedium)
                .foregroundColor(.white.opacity(0.9))
            
            Spacer()
        }
    }
}
