import SwiftUI

struct RankBeautyView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bgCream.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        beautyTopSection
                        beautyListSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("颜值榜")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("完成") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private var beautyTopSection: some View {
        HStack(alignment: .bottom, spacing: 12) {
            if MockData.beautyRankings.count > 1 {
                BeautyTopItem(item: MockData.beautyRankings[1], rank: 2, height: 100)
            }
            if let first = MockData.beautyRankings.first {
                BeautyTopItem(item: first, rank: 1, height: 130, isFirst: true)
            }
            if MockData.beautyRankings.count > 2 {
                BeautyTopItem(item: MockData.beautyRankings[2], rank: 3, height: 90)
            }
        }
        .padding(.top, 20)
    }
    
    private var beautyListSection: some View {
        VStack(spacing: 12) {
            ForEach(MockData.beautyRankings.dropFirst(3)) { item in
                BeautyListItem(item: item)
            }
        }
        .padding(.top, 20)
    }
}

struct BeautyTopItem: View {
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

struct BeautyListItem: View {
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
