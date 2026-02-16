import SwiftUI

struct AIFaceView: View {
    @State private var isScanning = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                headerSection
                uploadSection
                previewSection
                bottomSection
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.bgPure.ignoresSafeArea())
        .navigationTitle("AI喵相学")
    }
    
    private var headerSection: some View {
        VStack(spacing: 6) {
            Text("📸 面相速测")
                .font(.displayMedium)
                .foregroundColor(.inkBlack)
            
            Text("上传猫咪正脸照，AI为你解读喵星密码")
                .font(.bodyMedium)
                .foregroundColor(.grayPrimary)
                .multilineTextAlignment(.center)
        }
    }
    
    private var uploadSection: some View {
        VStack(spacing: 14) {
            Circle()
                .stroke(
                    LinearGradient.coral,
                    lineWidth: 2
                )
                .frame(width: 120, height: 120)
                .overlay(
                    Image(systemName: "camera.fill")
                        .font(.system(size: 48))
                        .foregroundColor(Color.coralPrimary)
                )
            
            Text("点击上传猫咪照片")
                .font(.bodyLarge.weight(.semibold))
                .foregroundColor(.inkBlack)
            
            Text("支持 JPG、PNG 格式")
                .font(.bodySmall)
                .foregroundColor(.graySecondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.bgPure)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(LinearGradient.coral, lineWidth: 2)
                )
        )
    }
    
    private var previewSection: some View {
        VStack(spacing: 12) {
            HStack {
                Text("🔍 扫描中...")
                    .font(.captionLarge.weight(.semibold))
                    .foregroundColor(Color.champagneGold)
                
                Spacer()
                
                Text("78%")
                    .font(.captionLarge.weight(.semibold))
                    .foregroundColor(.white)
            }
            
            Rectangle()
                .fill(LinearGradient.coral)
                .frame(height: 3)
            
            HStack(spacing: 8) {
                TagView(text: "易胖体质")
                TagView(text: "干饭机器")
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient.darkCard)
        )
    }
    
    private var bottomSection: some View {
        VStack(spacing: 12) {
            NavigationLink(destination: AIScanningView()) {
                Text("开始面相分析")
                    .font(.bodyLarge.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(LinearGradient.coral)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.coralPrimary.opacity(0.3), radius: 12, y: 4)
            }

            Button(action: { /* 打开相册 */ }) {
                Text("从相册选择")
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
