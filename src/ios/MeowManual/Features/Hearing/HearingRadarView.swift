import SwiftUI

struct HearingRadarView: View {
    let radarData = [0.8, 0.6, 0.9, 0.4, 0.7, 0.5]
    let dimensions = ["召唤系", "挑衅系", "猎奇系", "高频音", "低频音", "突发音"]
    
    var body: some View {
        ZStack {
            Color.bgCream.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    headerSection
                    radarCard
                    analysisCard
                    actionButtons
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("🎧 听力测试完成")
                .font(.displayMedium)
                .foregroundColor(.inkBlack)
            
            Text("已完成 6 项声音测试，生成听觉敏感度分析")
                .font(.bodyMedium)
                .foregroundColor(.grayPrimary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 8)
    }
    
    private var radarCard: some View {
        VStack(spacing: 20) {
            RadarChart(data: radarData, dimensions: dimensions)
                .frame(height: 280)
            
            HStack(spacing: 20) {
                ForEach(0..<3) { index in
                    VStack(spacing: 4) {
                        Text(dimensions[index])
                            .font(.captionSmall)
                            .foregroundColor(.grayPrimary)
                        Text("\(Int(radarData[index] * 100))%")
                            .font(.captionMedium.weight(.bold))
                            .foregroundColor(Color.coralPrimary)
                    }
                }
            }
            
            HStack(spacing: 20) {
                ForEach(3..<6) { index in
                    VStack(spacing: 4) {
                        Text(dimensions[index])
                            .font(.captionSmall)
                            .foregroundColor(.grayPrimary)
                        Text("\(Int(radarData[index] * 100))%")
                            .font(.captionMedium.weight(.bold))
                            .foregroundColor(Color.coralPrimary)
                    }
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
    
    private var analysisCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("性格判定")
                .font(.headlineSmall)
                .foregroundColor(.white)
            
            Text("对召唤系声音反应强烈，对挑衅系声音无视。你家主子是个\n【美食雷达】，只对吃的感兴趣！")
                .font(.bodyMedium)
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(4)
            
            FlowLayout(spacing: 8) {
                TagView2(text: "听觉过滤")
                TagView2(text: "选择性失聪")
                TagView2(text: "美食雷达")
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient.darkCard)
        )
    }
    
    private var actionButtons: some View {
        VStack(spacing: 12) {
            NavigationLink(destination: HearingTestView()) {
                Text("重新测试")
                    .font(.bodyLarge.weight(.medium))
                    .foregroundColor(.textPrimary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.bgGray)
                    )
            }
            
            NavigationLink(destination: SharePosterView()) {
                Text("分享结果")
                    .font(.bodyLarge.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient.coral)
                    )
                    .shadow(color: Color.coralPrimary.opacity(0.3), radius: 12, y: 4)
            }
        }
    }
}

struct RadarChart: View {
    let data: [Double]
    let dimensions: [String]
    
    var body: some View {
        GeometryReader { geometry in
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let radius = min(geometry.size.width, geometry.size.height) / 2 - 30
            let angleStep = 2 * Double.pi / Double(dimensions.count)
            
            ZStack {
                ForEach(1..<6) { level in
                    Polygon(
                        sides: dimensions.count,
                        radius: radius * Double(level) / Double(5)
                    )
                    .stroke(Color.grayTertiary.opacity(0.3), lineWidth: 1)
                }
                
                ForEach(0..<dimensions.count, id: \.self) { index in
                    let angle = Double(index) * angleStep - Double.pi / 2
                    let x = center.x + cos(angle) * radius
                    let y = center.y + sin(angle) * radius
                    
                    Path { path in
                        path.move(to: center)
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                    .stroke(Color.grayTertiary.opacity(0.3), lineWidth: 1)
                    
                    let labelX = center.x + cos(angle) * (radius + 20)
                    let labelY = center.y + sin(angle) * (radius + 20)
                    
                    Text(dimensions[index])
                        .font(.captionTiny)
                        .foregroundColor(.grayPrimary)
                        .position(x: labelX, y: labelY)
                }
                
                RadarPolygon(data: data, radius: radius)
                    .fill(Color.coralPrimary.opacity(0.3))
                    .overlay(
                        RadarPolygon(data: data, radius: radius)
                            .stroke(Color.coralPrimary, lineWidth: 2)
                    )
            }
        }
    }
}

struct Polygon: Shape {
    let sides: Int
    let radius: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let angleStep = 2 * Double.pi / Double(sides)
        
        for i in 0..<sides {
            let angle = Double(i) * angleStep - Double.pi / 2
            let x = center.x + cos(angle) * radius
            let y = center.y + sin(angle) * radius
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
    }
}

struct RadarPolygon: Shape {
    let data: [Double]
    let radius: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let angleStep = 2 * Double.pi / Double(data.count)
        
        for i in 0..<data.count {
            let angle = Double(i) * angleStep - Double.pi / 2
            let r = radius * data[i]
            let x = center.x + cos(angle) * r
            let y = center.y + sin(angle) * r
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
    }
}

struct TagView2: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.captionMedium.weight(.medium))
            .foregroundColor(Color.champagneGold)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.champagneGold.opacity(0.15))
            )
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: result.positions[index].x + bounds.minX,
                                      y: result.positions[index].y + bounds.minY),
                         proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if x + size.width > maxWidth && x > 0 {
                    x = 0
                    y += lineHeight + spacing
                    lineHeight = 0
                }
                
                positions.append(CGPoint(x: x, y: y))
                lineHeight = max(lineHeight, size.height)
                x += size.width + spacing
                
                self.size.width = max(self.size.width, x)
            }
            
            self.size.height = y + lineHeight
        }
    }
}
