import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.bgCream.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    userCard
                    settingsSection
                    logoutButton
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
    }
    
    private var userCard: some View {
        VStack(spacing: 20) {
            HStack(spacing: 16) {
                Circle()
                    .fill(Color.bgGray)
                    .frame(width: 88, height: 88)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.graySecondary)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("铲屎官")
                        .font(.headlineMedium)
                        .foregroundColor(.textPrimary)
                    
                    Text("ID: 88888888")
                        .font(.captionLarge)
                        .foregroundColor(.graySecondary)
                }
                
                Spacer()
            }
            
            HStack(spacing: 40) {
                StatItem(value: "12", label: "测试次数")
                StatItem(value: "3", label: "生成档案")
                StatItem(value: "28", label: "连续打卡")
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
        )
        .padding(.top, 8)
    }
    
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("设置")
                .font(.headlineSmall)
                .foregroundColor(.textPrimary)
            
            VStack(spacing: 0) {
                SettingRow(icon: "bell", title: "通知设置")
                Divider().padding(.leading, 56)
                SettingRow(icon: "doc.text", title: "隐私政策")
                Divider().padding(.leading, 56)
                SettingRow(icon: "info.circle", title: "关于喵星说明书")
                Divider().padding(.leading, 56)
                SettingRow(icon: "message", title: "意见反馈")
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.bgPure)
                    .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
            )
        }
    }
    
    private var logoutButton: some View {
        Button(action: {}) {
            Text("退出登录")
                .font(.bodyMedium.weight(.semibold))
                .foregroundColor(.dangerRed)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.bgPure)
                        .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
                )
        }
    }
}

struct StatItem: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.headlineMedium)
                .foregroundColor(.inkBlack)
            
            Text(label)
                .font(.captionSmall)
                .foregroundColor(.grayPrimary)
        }
    }
}

struct SettingRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.grayPrimary)
                .frame(width: 24)
            
            Text(title)
                .font(.bodyMedium)
                .foregroundColor(.textPrimary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 16))
                .foregroundColor(.graySecondary)
        }
        .padding(.horizontal, 16)
        .frame(height: 56)
    }
}
