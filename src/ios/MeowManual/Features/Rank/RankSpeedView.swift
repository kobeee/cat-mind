import SwiftUI

struct RankSpeedView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            Color.bgCream.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    tabSection
                    
                    if selectedTab == 0 {
                        speedRankContent
                    } else {
                        beautyRankContent
                    }
                    
                    Text("每周日 00:00 更新榜单")
                        .font(.captionSmall)
                        .foregroundColor(.graySecondary)
                        .padding(.top, 20)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
    }
    
    private var speedRankContent: some View {
        VStack(spacing: 20) {
            topThreeSection
            otherRanksSection
        }
    }
    
    private var beautyRankContent: some View {
        VStack(spacing: 20) {
            beautyTopThreeSection
            beautyOtherRanksSection
        }
    }
    
    private var tabSection: some View {
        HStack(spacing: 8) {
            Button(action: { selectedTab = 0 }) {
                Text("⚡ 手速榜")
                    .font(.captionLarge.weight(.semibold))
                    .foregroundColor(selectedTab == 0 ? .white : .grayPrimary)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(selectedTab == 0 ? 
                                LinearGradient(
                                    colors: [Color(red: 1.0, green: 0.58, blue: 0.0),
                                             Color(red: 1.0, green: 0.42, blue: 0.21)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ) :
                                LinearGradient(colors: [.clear, .clear], startPoint: .leading, endPoint: .trailing)
                            )
                    )
            }
            
            Button(action: { selectedTab = 1 }) {
                Text("颜值榜")
                    .font(.captionLarge.weight(.medium))
                    .foregroundColor(selectedTab == 1 ? .white : .grayPrimary)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(selectedTab == 1 ?
                                LinearGradient(
                                    colors: [Color(red: 1.0, green: 0.35, blue: 0.65),
                                             Color(red: 1.0, green: 0.25, blue: 0.55)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ) :
                                LinearGradient(colors: [.clear, .clear], startPoint: .leading, endPoint: .trailing)
                            )
                    )
            }
        }
        .padding(.top, 8)
    }
    
    private var topThreeSection: some View {
        HStack(alignment: .bottom, spacing: 12) {
            if MockData.speedRankings.count > 1 {
                TopRankItem(item: MockData.speedRankings[1], rank: 2, height: 100)
            }
            if let first = MockData.speedRankings.first {
                TopRankItem(item: first, rank: 1, height: 130, isFirst: true)
            }
            if MockData.speedRankings.count > 2 {
                TopRankItem(item: MockData.speedRankings[2], rank: 3, height: 90)
            }
        }
        .padding(.top, 20)
    }
    
    private var otherRanksSection: some View {
        VStack(spacing: 12) {
            ForEach(MockData.speedRankings.dropFirst(3)) { item in
                RankListItem(item: item)
            }
        }
        .padding(.top, 20)
    }
    
    private var beautyTopThreeSection: some View {
        HStack(alignment: .bottom, spacing: 12) {
            if MockData.beautyRankings.count > 1 {
                BeautyTopRankItem(item: MockData.beautyRankings[1], rank: 2, height: 100)
            }
            if let first = MockData.beautyRankings.first {
                BeautyTopRankItem(item: first, rank: 1, height: 130, isFirst: true)
            }
            if MockData.beautyRankings.count > 2 {
                BeautyTopRankItem(item: MockData.beautyRankings[2], rank: 3, height: 90)
            }
        }
        .padding(.top, 20)
    }
    
    private var beautyOtherRanksSection: some View {
        VStack(spacing: 12) {
            ForEach(MockData.beautyRankings.dropFirst(3)) { item in
                BeautyRankListItem(item: item)
            }
        }
        .padding(.top, 20)
    }
}

struct BeautyTopRankItem: View {
    let item: RankingItem
    let rank: Int
    let height: CGFloat
    var isFirst: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                if isFirst {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 20))
                        .foregroundColor(Color.champagneGold)
                        .offset(y: -35)
                }
                
                Text(item.emoji)
                    .font(.system(size: isFirst ? 56 : 40))
                    .frame(width: isFirst ? 88 : 72, height: isFirst ? 88 : 72)
                    .background(
                        Group {
                            if isFirst {
                                Circle()
                                    .fill(LinearGradient(
                                        colors: [Color(red: 1.0, green: 0.42, blue: 0.62),
                                                 Color(red: 0.75, green: 0.52, blue: 0.99)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                            } else {
                                Circle()
                                    .fill(Color.bgGray)
                            }
                        }
                    )
                
                Text("\(rank)")
                    .font(.captionMedium.weight(.bold))
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .background(
                        Circle()
                            .fill(isFirst ? Color(red: 1.0, green: 0.42, blue: 0.62) : Color.grayPrimary)
                    )
                    .offset(x: 28, y: 28)
            }
            
            Text(item.name)
                .font(.bodyMedium.weight(.semibold))
                .foregroundColor(.textPrimary)
            
            Text("\(item.score)")
                .font(.scoreDisplay)
                .foregroundColor(Color(red: 1.0, green: 0.42, blue: 0.62))
            
            Text(item.type)
                .font(.captionSmall)
                .foregroundColor(.grayPrimary)
        }
        .frame(height: height + 150)
    }
}

struct BeautyRankListItem: View {
    let item: RankingItem
    
    var body: some View {
        HStack(spacing: 12) {
            Text("\(item.rank)")
                .font(.bodyMedium.weight(.bold))
                .foregroundColor(.grayPrimary)
                .frame(width: 32)
            
            Text(item.emoji)
                .font(.system(size: 40))
                .frame(width: 56, height: 56)
                .background(
                    Circle()
                        .fill(Color.bgGray)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.bodyMedium.weight(.semibold))
                    .foregroundColor(.textPrimary)
                
                Text(item.type)
                    .font(.captionSmall)
                    .foregroundColor(.grayPrimary)
            }
            
            Spacer()
            
            Text("\(item.score)")
                .font(.bodyLarge.weight(.bold))
                .foregroundColor(Color(red: 1.0, green: 0.42, blue: 0.62))
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
        )
    }
}

struct TopRankItem: View {
    let item: RankingItem
    let rank: Int
    let height: CGFloat
    var isFirst: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                if isFirst {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 20))
                        .foregroundColor(Color.champagneGold)
                        .offset(y: -35)
                }
                
                Text(item.emoji)
                    .font(.system(size: isFirst ? 56 : 40))
                    .frame(width: isFirst ? 88 : 72, height: isFirst ? 88 : 72)
                    .background(
                        Group {
                            if isFirst {
                                Circle()
                                    .fill(LinearGradient(colors: [.coralGradientStart, .coralGradientEnd],
                                                 startPoint: .topLeading, endPoint: .bottomTrailing))
                            } else {
                                Circle()
                                    .fill(Color.bgGray)
                            }
                        }
                    )
                
                Text("\(rank)")
                    .font(.captionMedium.weight(.bold))
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .background(
                        Circle()
                            .fill(isFirst ? Color.coralPrimary : Color.grayPrimary)
                    )
                    .offset(x: 28, y: 28)
            }
            
            Text(item.name)
                .font(.bodyMedium.weight(.semibold))
                .foregroundColor(.textPrimary)
            
            Text("\(item.score)")
                .font(.scoreDisplay)
                .foregroundColor(.accentOrange)
            
            Text(item.type)
                .font(.captionSmall)
                .foregroundColor(.grayPrimary)
        }
        .frame(height: height + 150)
    }
}

struct RankListItem: View {
    let item: RankingItem
    
    var body: some View {
        HStack(spacing: 12) {
            Text("\(item.rank)")
                .font(.bodyMedium.weight(.bold))
                .foregroundColor(.grayPrimary)
                .frame(width: 32)
            
            Text(item.emoji)
                .font(.system(size: 40))
                .frame(width: 56, height: 56)
                .background(
                    Circle()
                        .fill(Color.bgGray)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.bodyMedium.weight(.semibold))
                    .foregroundColor(.textPrimary)
                
                Text(item.type)
                    .font(.captionSmall)
                    .foregroundColor(.grayPrimary)
            }
            
            Spacer()
            
            Text("\(item.score)")
                .font(.bodyLarge.weight(.bold))
                .foregroundColor(.accentOrange)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
        )
    }
}
