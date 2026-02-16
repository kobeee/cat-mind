import SwiftUI

struct PawGameView: View {
    @State private var score = 0
    @State private var combo = 0
    @State private var timeRemaining = 30
    @State private var targets: [TargetItem] = []
    @State private var gameActive = true
    @State private var showResult = false
    @State private var gameAreaSize: CGSize = .zero
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.bgDeep.ignoresSafeArea()
            
            VStack(spacing: 0) {
                gameHeader
                gameArea
            }
            
            if showResult {
                PawResultView(score: score, combo: combo, onRestart: startGame, onDismiss: { showResult = false })
            }
        }
        .onAppear { startGame() }
        .onReceive(timer) { _ in
            if gameActive && timeRemaining > 0 {
                timeRemaining -= 1
                spawnTarget()
            } else if timeRemaining == 0 {
                endGame()
            }
        }
    }
    
    private var gameHeader: some View {
        HStack {
            VStack(spacing: 4) {
                Text("\(combo)")
                    .font(.comboDisplay)
                    .foregroundColor(Color.champagneGold)
                Text("连击")
                    .font(.captionMedium)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("\(timeRemaining)")
                    .font(.scoreDisplay)
                    .foregroundColor(timeRemaining <= 5 ? .dangerRed : Color.white)
                Text("秒")
                    .font(.captionMedium)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("\(score)")
                    .font(.scoreDisplay)
                    .foregroundColor(.accentOrange)
                Text("得分")
                    .font(.captionMedium)
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(.ultraThinMaterial)
    }
    
    private var gameArea: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(targets) { target in
                    GameTarget(target: target) {
                        hitTarget(target)
                    }
                    .position(target.position)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                gameAreaSize = geometry.size
            }
            .onChange(of: geometry.size) { newSize in
                gameAreaSize = newSize
            }
        }
    }
    
    private func startGame() {
        score = 0
        combo = 0
        timeRemaining = 30
        gameActive = true
        targets = []
        showResult = false
    }
    
    private func spawnTarget() {
        guard gameActive else { return }
        
        // 使用实际游戏区域尺寸，避免生成在Tab Bar区域
        let areaWidth = max(gameAreaSize.width - 80, 100)
        let areaHeight = max(gameAreaSize.height - 80, 100)
        let x = CGFloat.random(in: 40...areaWidth)
        let y = CGFloat.random(in: 40...areaHeight)
        
        let target = TargetItem(
            position: CGPoint(x: x, y: y),
            createdAt: Date()
        )
        
        targets.append(target)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            targets.removeAll { $0.id == target.id }
            if combo > 0 {
                combo = 0
            }
        }
    }
    
    private func hitTarget(_ target: TargetItem) {
        targets.removeAll { $0.id == target.id }
        combo += 1
        score += 10 + (combo > 5 ? combo : 0)
    }
    
    private func endGame() {
        gameActive = false
        showResult = true
    }
}

struct TargetItem: Identifiable {
    let id = UUID()
    let position: CGPoint
    let createdAt: Date
}

struct GameTarget: View {
    let target: TargetItem
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 60, height: 60)
                    .shadow(color: .red.opacity(0.5), radius: 10)
                
                Circle()
                    .fill(.white.opacity(0.3))
                    .frame(width: 40, height: 40)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct PawResultView: View {
    let score: Int
    let combo: Int
    let onRestart: () -> Void
    let onDismiss: () -> Void
    
    var rank: String {
        if score > 500 { return "无影爪宗师" }
        if score > 300 { return "快爪手" }
        if score > 150 { return "灵活猫" }
        return "慵懒型"
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("挑战结束！")
                    .font(.displayMedium)
                    .foregroundColor(.white)
                
                VStack(spacing: 16) {
                    ResultRow(label: "最终得分", value: "\(score)", highlight: true)
                    ResultRow(label: "最高连击", value: "\(combo)", highlight: false)
                    ResultRow(label: "获得称号", value: rank, highlight: true)
                }
                
                HStack(spacing: 12) {
                    Button(action: {
                        onRestart()
                    }) {
                        Text("再玩一次")
                            .font(.bodyMedium.weight(.semibold))
                            .foregroundColor(.textPrimary)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.bgGray)
                            )
                    }
                    
                    NavigationLink(destination: SharePosterView()) {
                        Text("分享成绩")
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
            .padding(32)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(LinearGradient.darkCard)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(.white.opacity(0.1), lineWidth: 1)
                    )
            )
            .padding(.horizontal, 40)
        }
    }
}

struct ResultRow: View {
    let label: String
    let value: String
    let highlight: Bool
    
    var body: some View {
        HStack {
            Text(label)
                .font(.bodyMedium)
                .foregroundColor(.white.opacity(0.7))
            
            Spacer()
            
            Text(value)
                .font(.bodyLarge.weight(highlight ? .bold : .semibold))
                .foregroundColor(highlight ? .accentOrange : Color.white)
        }
    }
}
