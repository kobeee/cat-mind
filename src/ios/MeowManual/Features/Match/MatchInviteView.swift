import SwiftUI

struct MatchInviteView: View {
    var body: some View {
        ZStack {
            Color.bgCream.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    catsComparison
                    qrCard
                    actionButtons
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationTitle("邀请好友")
    }
    
    private var catsComparison: some View {
        HStack(spacing: 20) {
            VStack(spacing: 8) {
                Text("🐱")
                    .font(.system(size: 56))
                    .frame(width: 88, height: 88)
                    .background(
                        Circle()
                            .fill(LinearGradient.coral)
                    )
                
                Text("橘子")
                    .font(.bodyMedium.weight(.semibold))
                    .foregroundColor(.textPrimary)
                
                Text("霸总猫")
                    .font(.captionSmall)
                    .foregroundColor(Color.coralPrimary)
            }
            
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 32))
                .foregroundColor(.graySecondary)
            
            VStack(spacing: 8) {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
                    .frame(width: 88, height: 88)
                    .foregroundColor(.grayTertiary)
                    .overlay(
                        Image(systemName: "questionmark")
                            .font(.system(size: 32))
                            .foregroundColor(.graySecondary)
                    )
                
                Text("等待中...")
                    .font(.bodyMedium.weight(.semibold))
                    .foregroundColor(.grayPrimary)
                
                Text("朋友的猫")
                    .font(.captionSmall)
                    .foregroundColor(.graySecondary)
            }
        }
        .padding(.top, 8)
    }
    
    private var qrCard: some View {
        VStack(spacing: 16) {
            Text("扫码参与双猫匹配")
                .font(.headlineSmall)
                .foregroundColor(.textPrimary)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.bgGray)
                .frame(width: 180, height: 180)
                .overlay(
                    Image(systemName: "qrcode")
                        .font(.system(size: 100))
                        .foregroundColor(.textPrimary)
                )
            
            Text("让好友扫码上传猫咪照片")
                .font(.bodySmall)
                .foregroundColor(.graySecondary)
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
        )
    }
    
    private var actionButtons: some View {
        VStack(spacing: 12) {
            NavigationLink(destination: SharePosterView()) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("发送给朋友")
                }
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

            Button(action: {}) {
                HStack {
                    Image(systemName: "square.and.arrow.down")
                    Text("保存到相册")
                }
                .font(.bodyLarge.weight(.medium))
                .foregroundColor(.textPrimary)
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
    }
}
