import SwiftUI

struct AIScanningView: View {
    @State private var progress: Double = 0
    @State private var currentItem = 0
    @State private var isScanning = true
    @State private var showResult = false
    
    let scanItems = [
        (icon: "eye", text: "瞳孔识别", color: Color.coralPrimary),
        (icon: "ear", text: "耳型分析", color: Color.accentOrange),
        (icon: "scribble", text: "胡须检测", color: Color.champagneGold),
        (icon: "face.smiling", text: "面相测算", color: Color.successGreen)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDeep.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    navigationBar
                    
                    Spacer()
                    
                    scanningFrame
                    
                    Spacer()
                    
                    progressSection
                }
            }
            .onAppear {
                startScanning()
            }
            .navigationDestination(isPresented: $showResult) {
                AIFaceResultView()
            }
        }
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
            
            Text("AI扫描中")
                .font(.headlineSmall)
                .foregroundColor(.white)
            
            Spacer()
            
            Color.clear.frame(width: 40, height: 40)
        }
        .padding(.horizontal, 20)
        .frame(height: 56)
    }
    
    private var scanningFrame: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.black.opacity(0.3))
                .frame(width: 280, height: 280)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.champagneGold.opacity(0.5), lineWidth: 2)
                )
            
            GridOverlay()
            
            ScanningLine()
                .stroke(Color.coralPrimary, lineWidth: 2)
                .frame(width: 260, height: 260)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            ScanningPoints()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("\(Int(progress * 100))%")
                        .font(.headlineMedium.weight(.bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black.opacity(0.6))
                        )
                        .padding(16)
                }
            }
            .frame(width: 280, height: 280)
        }
    }
    
    private var progressSection: some View {
        VStack(spacing: 24) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(LinearGradient.coral)
                        .frame(width: geometry.size.width * progress, height: 8)
                }
            }
            .frame(height: 8)
            
            VStack(spacing: 12) {
                ForEach(0..<scanItems.count, id: \.self) { index in
                    ScanItemRow(
                        icon: scanItems[index].icon,
                        text: scanItems[index].text,
                        color: scanItems[index].color,
                        isActive: index == currentItem,
                        isCompleted: index < currentItem
                    )
                }
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient.darkCard)
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
    
    private func startScanning() {
        guard isScanning else { return }
        
        withAnimation(.linear(duration: 0.5)) {
            progress += 0.01
        }
        
        currentItem = min(Int(progress * Double(scanItems.count)), scanItems.count - 1)
        
        if progress >= 1.0 {
            isScanning = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showResult = true
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                startScanning()
            }
        }
    }
}

struct GridOverlay: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let spacing: CGFloat = 40
            
            ZStack {
                ForEach(0..<Int(width/spacing), id: \.self) { i in
                    Rectangle()
                        .fill(Color.white.opacity(0.1))
                        .frame(width: 1, height: height)
                        .position(x: CGFloat(i) * spacing, y: height/2)
                }
                
                ForEach(0..<Int(height/spacing), id: \.self) { i in
                    Rectangle()
                        .fill(Color.white.opacity(0.1))
                        .frame(width: width, height: 1)
                        .position(x: width/2, y: CGFloat(i) * spacing)
                }
            }
        }
        .frame(width: 260, height: 260)
    }
}

struct ScanningLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height / 2))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
        return path
    }
}

struct ScanningPoints: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            ScanPoint(x: 60, y: 60, delay: 0)
            ScanPoint(x: 200, y: 80, delay: 0.2)
            ScanPoint(x: 100, y: 180, delay: 0.4)
            ScanPoint(x: 220, y: 200, delay: 0.6)
        }
        .frame(width: 260, height: 260)
    }
}

struct ScanPoint: View {
    let x: CGFloat
    let y: CGFloat
    let delay: Double
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.coralPrimary.opacity(0.3))
                .frame(width: isAnimating ? 24 : 8, height: isAnimating ? 24 : 8)
            
            Circle()
                .fill(Color.coralPrimary)
                .frame(width: 8, height: 8)
        }
        .position(x: x, y: y)
        .onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(delay)) {
                isAnimating = true
            }
        }
    }
}

struct ScanItemRow: View {
    let icon: String
    let text: String
    let color: Color
    let isActive: Bool
    let isCompleted: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(isCompleted ? color : color.opacity(0.2))
                    .frame(width: 32, height: 32)
                
                if isCompleted {
                    Image(systemName: "checkmark")
                        .font(.captionMedium.weight(.bold))
                        .foregroundColor(.white)
                } else {
                    Image(systemName: icon)
                        .font(.captionMedium)
                        .foregroundColor(isActive ? color : .white.opacity(0.5))
                }
            }
            
            Text(text)
                .font(.bodyMedium.weight(isActive ? .semibold : .medium))
                .foregroundColor(isActive ? .white : .white.opacity(0.5))
            
            Spacer()
            
            if isActive {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: color))
                    .scaleEffect(0.8)
            }
        }
    }
}
