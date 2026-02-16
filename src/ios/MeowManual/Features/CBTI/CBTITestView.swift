import SwiftUI

struct CBTITestView: View {
    @State private var currentQuestion = 0
    @State private var selectedOption: Int? = nil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                progressBar
                questionCard
                optionsSection
                bottomButtons
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
        }
        .background(Color.bgPure.ignoresSafeArea())
        .navigationTitle("CBTI性格测试")
    }
    
    private var navigationBar: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "arrow.backward")
                    .font(.bodyLarge.weight(.semibold))
                    .foregroundColor(.grayPrimary)
                    .frame(width: 40, height: 40)
                    .background(Color.bgGray)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Spacer()
            
            Text("CBTI性格测试")
                .font(.headlineSmall)
                .foregroundColor(.inkBlack)
            
            Spacer()
            
            Text("5/20")
                .font(.bodyMedium.weight(.semibold))
                .foregroundColor(Color.coralPrimary)
        }
        .padding(.horizontal, 20)
        .frame(height: 56)
    }
    
    private var progressBar: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.bgGray)
                
                Rectangle()
                    .fill(LinearGradient.coral)
                    .frame(width: geometry.size.width * 0.25)
            }
        }
        .frame(height: 4)
    }
    
    private var questionCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("QUESTION 05")
                .font(.captionMedium.weight(.bold))
                .foregroundColor(Color.coralPrimary)
                .tracking(1)
            
            Text("当快递员敲门时，你家主子的反应是？")
                .font(.headlineMedium)
                .foregroundColor(.inkBlack)
                .lineSpacing(4)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.bgPure)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)
        )
    }
    
    private var optionsSection: some View {
        VStack(spacing: 12) {
            OptionButton(label: "A", text: "骂骂咧咧冲门口", isSelected: selectedOption == 0) {
                selectedOption = 0
            }
            
            OptionButton(label: "B", text: "瞬间移动到床底", isSelected: selectedOption == 1) {
                selectedOption = 1
            }
            
            OptionButton(label: "C", text: "毫无波澜继续睡", isSelected: selectedOption == 2) {
                selectedOption = 2
            }
        }
    }
    
    private var bottomButtons: some View {
        HStack(spacing: 12) {
            Button(action: {
                if currentQuestion > 0 {
                    currentQuestion -= 1
                }
            }) {
                Text("上题")
                    .font(.bodyLarge.weight(.medium))
                    .foregroundColor(.grayPrimary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.bgGray)
                    )
            }
            
            if currentQuestion < 19 {
                Button(action: {
                    currentQuestion += 1
                    selectedOption = nil
                }) {
                    Text("下题")
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
            } else {
                NavigationLink(destination: ManualGeneratingView()) {
                    Text("查看结果")
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
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.bgPure)
    }
}

struct OptionButton: View {
    let label: String
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Text(label)
                    .font(.bodyLarge.weight(.bold))
                    .foregroundColor(isSelected ? .white : Color.grayPrimary)
                    .frame(width: 36, height: 36)
                .background(
                    Group {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(LinearGradient.coral)
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.bgGray)
                        }
                    }
                )
                
                Text(text)
                    .font(.bodyMedium.weight(.medium))
                    .foregroundColor(isSelected ? .white : .textPrimary)
                
                Spacer()
            }
            .padding(16)
            .background(
                Group {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient.darkCard)
                    } else {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.bgPure)
                    }
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? Color.clear : Color.grayTertiary, lineWidth: 1)
            )
        }
    }
}
