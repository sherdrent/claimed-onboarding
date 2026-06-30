import SwiftUI

struct ClaimFormScreen: View {
    @ObservedObject var state: AppState

    private var claimIds: [String] { Array(state.selectedClaims) }
    private var currentClaimId: String { claimIds[state.currentClaimIndex] }
    private var currentClaim: ClaimItem? { claimItems.first { $0.id == currentClaimId } }
    private var questions: [String] { claimForms[currentClaimId] ?? [] }
    private var isLast: Bool { state.currentClaimIndex == claimIds.count - 1 }
    private var progress: Double { Double(state.currentClaimIndex + 1) / Double(claimIds.count) }
    private var currentAnswers: [Int: String] { state.claimAnswers[currentClaimId] ?? [:] }

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Spacer()
                        ClaimedLogo()
                        Spacer()
                    }
                    .padding(.bottom, 16)

                    // Progress bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color(hex: "E5E7EB"))
                                .frame(height: 6)
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Theme.accent)
                                .frame(width: geo.size.width * progress, height: 6)
                        }
                    }
                    .frame(height: 6)
                    .padding(.bottom, 20)

                    Text("Claim \(state.currentClaimIndex + 1) of \(claimIds.count): \(currentClaim?.name ?? "")")
                        .font(.system(size: 22, weight: .heavy))
                        .padding(.bottom, 8)

                    Text("Let's practice submitting your first claims.")
                        .font(.system(size: 14))
                        .foregroundColor(Theme.textSecondary)
                        .padding(.bottom, 24)

                    ForEach(Array(questions.enumerated()), id: \.offset) { index, question in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(question)
                                .font(.system(size: 15, weight: .medium))
                                .lineSpacing(2)

                            HStack(spacing: 8) {
                                YesNoButton(
                                    title: "Yes",
                                    isSelected: currentAnswers[index] == "yes"
                                ) {
                                    state.answerClaimQuestion(claimId: currentClaimId, questionIndex: index, answer: "yes")
                                }
                                YesNoButton(
                                    title: "No",
                                    isSelected: currentAnswers[index] == "no"
                                ) {
                                    state.answerClaimQuestion(claimId: currentClaimId, questionIndex: index, answer: "no")
                                }
                            }
                        }
                        .padding(.bottom, 20)
                    }
                }
                .padding(16)
                .padding(.bottom, 100)
            }

            // Bottom bar
            HStack(spacing: 8) {
                Button(action: goNextOrFinish) {
                    Text("Skip for now")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Theme.textPrimary)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .overlay(
                            Capsule()
                                .stroke(Theme.border, lineWidth: 1)
                        )
                }

                Button(action: goNextOrFinish) {
                    Text(isLast ? "Complete" : "Next Claim")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Theme.red)
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .padding(.bottom, 12)
            .background(.white)
            .shadow(color: .black.opacity(0.1), radius: 8, y: -4)
        }
    }

    private func goNextOrFinish() {
        if isLast {
            state.step = .thankyou
        } else {
            state.currentClaimIndex += 1
        }
    }
}
