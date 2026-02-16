import SwiftUI

struct ArchiveView: View {
    var body: some View {
        ZStack {
            Color.bgCream.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    archiveCard
                    recordsSection
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
    }
    
    private var archiveCard: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                Text("🐱")
                    .font(.system(size: 64))
                    .frame(width: 88, height: 88)
                    .background(
                        Circle()
                            .fill(LinearGradient.coral)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("橘子")
                        .font(.headlineMedium)
                        .foregroundColor(.textPrimary)
                    
                    Text("E型社牛猫")
                        .font(.captionLarge)
                        .foregroundColor(Color.coralPrimary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.coralPrimary.opacity(0.1))
                        )
                }
                
                Spacer()
            }
            
            HStack(spacing: 12) {
                StatBox(label: "面相评分", value: "98分")
                StatBox(label: "出厂型号", value: "MEOW-SN-2024")
            }
            
            NavigationLink(destination: ManualResultView()) {
                Text("查看说明书")
                    .font(.bodyMedium.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(LinearGradient.coral)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
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
    
    private var recordsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("测试记录")
                    .font(.headlineSmall)
                    .foregroundColor(.textPrimary)
                
                Spacer()
                
                Text("查看全部")
                    .font(.captionLarge)
                    .foregroundColor(.grayPrimary)
            }
            
            VStack(spacing: 12) {
                ForEach(MockData.archiveRecords) { record in
                    RecordRow(record: record)
                }
            }
        }
    }
}

struct StatBox: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.captionSmall)
                .foregroundColor(.grayPrimary)
            
            Text(value)
                .font(.bodyMedium.weight(.bold))
                .foregroundColor(.textPrimary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.bgGray)
        )
    }
}

struct RecordRow: View {
    let record: ArchiveRecord
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: record.type.icon)
                .font(.system(size: 24))
                .foregroundColor(Color.coralPrimary)
                .frame(width: 48, height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.coralPrimary.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(record.title)
                    .font(.bodyMedium.weight(.semibold))
                    .foregroundColor(.textPrimary)
                
                Text(record.desc)
                    .font(.captionLarge)
                    .foregroundColor(.grayPrimary)
            }
            
            Spacer()
            
            Text(record.date)
                .font(.captionSmall)
                .foregroundColor(.graySecondary)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
        )
    }
}
