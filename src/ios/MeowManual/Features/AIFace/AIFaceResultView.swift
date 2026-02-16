import SwiftUI

struct AIFaceResultView: View {
    let faceScore = 98
    let tags = [
        (icon: "🐾", text: "橘色花纹"),
        (icon: "⚡", text: "易胖体质"),
        (icon: "🏆", text: "鄙视链顶端"),
        (icon: "🍴", text: "干饭机器")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                headerSection
                photoScoreCard
                tagsCard
                coreTraitCard
                bottomButtons
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.bgPure.ignoresSafeArea())
    }
    
    private var headerSection: some View {
        VStack(spacing: 6) {
            Text("📸 AI喵相诊断单")
                .font(.displayMedium)
                .foregroundColor(.inkBlack)
            
            Text("基于面相识别算法分析")
                .font(.bodyMedium)
                .foregroundColor(.grayPrimary)
        }
        .padding(.top, 8)
    }
    
    private var photoScoreCard: some View {
        VStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.bgGray)
                    .frame(height: 200)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 48))
                            .foregroundColor(.graySecondary)
                    )
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(faceScore)分")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(LinearGradient.coral)
                            )
                            .padding(12)
                    }
                }
            }
            
            Text("面相圆润饱满，天庭开阔，地阁方圆，是典型的福相。眼神清澈明亮，显示出良好的精神状态。")
                .font(.bodyMedium)
                .foregroundColor(.textSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
        )
    }
    
    private var tagsCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("面相识别结果")
                .font(.headlineSmall)
                .foregroundColor(.textPrimary)
            
            FlowLayout(spacing: 16) {
                ForEach(tags, id: \.text) { tag in
                    HStack(spacing: 6) {
                        Text(tag.icon)
                            .font(.bodyMedium)
                        Text(tag.text)
                            .font(.bodyMedium.weight(.medium))
                            .foregroundColor(.textPrimary)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.bgGray)
                    )
                    .frame(width: 140)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
        )
    }
    
    private var coreTraitCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(Color.accentOrange)
                
                Text("核心槽点")
                    .font(.headlineSmall)
                    .foregroundColor(.textPrimary)
            }
            
            Text("食欲过于旺盛，容易发胖，建议控制饮食。")
                .font(.bodyMedium)
                .foregroundColor(.textSecondary)
                .lineSpacing(4)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.accentOrange.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.accentOrange.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    private var bottomButtons: some View {
        VStack(spacing: 12) {
            NavigationLink(destination: CBTITestView()) {
                Text("开始CBTI深度测试")
                    .font(.bodyLarge.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(LinearGradient.coral)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.coralPrimary.opacity(0.3), radius: 12, y: 4)
            }
            
            NavigationLink(destination: SharePosterView()) {
                Text("分享诊断单")
                    .font(.bodyLarge.weight(.medium))
                    .foregroundColor(.inkBlack)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
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
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.bgPure)
    }
}
