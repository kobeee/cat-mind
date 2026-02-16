import SwiftUI

struct ManualGeneratingView: View {
    @State private var progress: Double = 0
    @State private var currentTipIndex = 0
    @State private var isGenerating = true
    
    let tips = [
        "💡 冷知识：猫咪的胡须可以感知气流变化",
        "💡 冷知识：猫一天睡16小时是正常水平",
        "💡 冷知识：猫咪用肉垫出汗散热",
        "💡 冷知识：猫能看到紫外线",
        "💡 冷知识：每只猫的鼻纹都是独一无二的"
    ]
    
    var body: some View {
        ZStack {
            Color.bgCream.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                
                animationSection
                
                progressSection
                
                tipSection
                
                Spacer()
                
                if progress >= 1.0 {
                    NavigationLink(destination: ManualResultView()) {
                        Text("查看说明书")
                            .font(.bodyLarge.weight(.semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(LinearGradient.coral)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Color.coralPrimary.opacity(0.3), radius: 12, y: 4)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
        }
        .onAppear {
            startGenerating()
            startTipRotation()
        }
    }
    
    private var animationSection: some View {
        VStack(spacing: 20) {
            ZStack {
                ForEach(0..<3) { i in
                    PulsingCircle(delay: Double(i) * 0.3)
                }
                
                Image(systemName: "pawprint.fill")
                    .font(.system(size: 64))
                    .foregroundStyle(LinearGradient.coral)
            }
            .frame(width: 200, height: 200)
            
            Text("说明书生成中...")
                .font(.headlineMedium)
                .foregroundColor(.inkBlack)
        }
    }
    
    private var progressSection: some View {
        VStack(spacing: 12) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.bgGray)
                        .frame(height: 16)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(LinearGradient.coral)
                        .frame(width: geometry.size.width * progress, height: 16)
                }
            }
            .frame(height: 16)
            
            HStack {
                Text("正在分析性格数据...")
                    .font(.bodyMedium)
                    .foregroundColor(.grayPrimary)
                
                Spacer()
                
                Text("\(Int(progress * 100))%")
                    .font(.bodyMedium.weight(.semibold))
                    .foregroundColor(Color.coralPrimary)
            }
        }
        .padding(.horizontal, 20)
    }
    
    private var tipSection: some View {
        VStack(spacing: 16) {
            Text(tips[currentTipIndex])
                .font(.bodyMedium)
                .foregroundColor(.textSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .frame(height: 60)
                .animation(.easeInOut(duration: 0.5), value: currentTipIndex)
            
            HStack(spacing: 8) {
                ForEach(0..<tips.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentTipIndex ? Color.coralPrimary : Color.grayTertiary)
                        .frame(width: 8, height: 8)
                        .animation(.easeInOut(duration: 0.3), value: currentTipIndex)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
        )
        .padding(.horizontal, 20)
    }
    
    private func startGenerating() {
        guard isGenerating else { return }
        
        withAnimation(.linear(duration: 0.05)) {
            progress += 0.01
        }
        
        if progress < 1.0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                startGenerating()
            }
        } else {
            isGenerating = false
        }
    }
    
    private func startTipRotation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                currentTipIndex = (currentTipIndex + 1) % tips.count
            }
            if progress < 1.0 {
                startTipRotation()
            }
        }
    }
}

struct PulsingCircle: View {
    let delay: Double
    @State private var isAnimating = false
    
    var body: some View {
        Circle()
            .stroke(Color.coralPrimary.opacity(0.3), lineWidth: 2)
            .frame(width: isAnimating ? 180 : 60, height: isAnimating ? 180 : 60)
            .opacity(isAnimating ? 0 : 1)
            .onAppear {
                withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false).delay(delay)) {
                    isAnimating = true
                }
            }
    }
}
