import SwiftUI

struct QuestionScreen: View {
    let question: BrandQuestion
    let questionIndex: Int
    let totalQuestions: Int
    let onAnswer: (String) -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ClaimedLogo()
                Spacer()
                QuestionCounter(current: questionIndex + 1, total: totalQuestions)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 8)

            VStack(spacing: 0) {
                // Blue header
                HStack {
                    ClaimedLogo()
                    Spacer()
                    Text("\(questionIndex + 1)/\(totalQuestions) questions")
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.white)
                        .clipShape(Capsule())
                }
                .padding(12)
                .background(Theme.accent)
                .clipShape(
                    .rect(topLeadingRadius: 20, topTrailingRadius: 20)
                )

                ZStack(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 0) {
                        // Brand icon
                        Image(question.iconName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: .black.opacity(0.12), radius: 4, y: 2)
                            .background(.white)
                            .padding(.top, -10)

                        // Question text
                        questionText
                            .padding(.top, 12)

                        Spacer()

                        // Brand logo
                        Image(question.logoName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 196, height: 196)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Theme.border, lineWidth: 1)
                            )
                            .shadow(color: .black.opacity(0.12), radius: 4, y: 2)
                            .frame(maxWidth: .infinity)

                        Spacer()

                        // Answer buttons
                        VStack(spacing: 8) {
                            AnswerButton(title: "Yes") { onAnswer("yes") }
                            AnswerButton(title: "No") { onAnswer("no") }
                            AnswerButton(title: "Prefer not to say") { onAnswer("skip") }
                        }
                    }
                    .padding(16)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Theme.accent, lineWidth: 3)
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }

    private var questionText: some View {
        let parts = question.question.components(separatedBy: question.brand)
        return Group {
            if parts.count == 2 {
                (Text(parts[0])
                    .foregroundColor(Theme.textPrimary)
                 + Text(question.brand)
                    .foregroundColor(Theme.accent)
                 + Text(parts[1])
                    .foregroundColor(Theme.textPrimary))
                    .font(.system(size: 24, weight: .heavy))
                    .tracking(-0.5)
                    .lineSpacing(4)
            } else {
                Text(question.question)
                    .font(.system(size: 24, weight: .heavy))
                    .tracking(-0.5)
                    .lineSpacing(4)
                    .foregroundColor(Theme.textPrimary)
            }
        }
    }
}
