import SwiftUI

struct ContentView: View {
    @StateObject private var state = AppState()

    var body: some View {
        Group {
            switch state.step {
            case .intro1:
                IntroScreen(
                    headingParts: [("There's ", false), ("cash out", true), (" there with ", false), ("your name on it", true), (".", false)],
                    subtitle: "Companies owe people money from lawsuits all the time. Most never claim it.",
                    imageName: "unclaimed-folder-new",
                    onNext: { state.step = .intro2 }
                )
            case .intro2:
                IntroScreen(
                    headingParts: [("We find the ", false), ("payouts", true), (". You get the ", false), ("cash", true)],
                    subtitle: "We search for claims you're eligible for — just answer a few quick questions.",
                    imageName: "settlement-cards",
                    onNext: { state.step = .intro3 }
                )
            case .intro3:
                IntroScreen(
                    headingParts: [("We'll ", false), ("track your claims", true), (" & tell you when you get ", false), ("paid", true), (".", false)],
                    subtitle: "We update you on your claim & alert you when the payout hits.",
                    imageName: "claim-tracker-new",
                    onNext: { state.step = .intro4 }
                )
            case .intro4:
                IntroScreen(
                    headingParts: [("$40M+", true), (" back to consumers.", false)],
                    subtitle: "We've helped people file over 500,000 claims worth more than $40 million in payouts.",
                    imageName: "phone-notifications-new",
                    onNext: { state.step = .intro5 }
                )
            case .intro5:
                IntroScreen(
                    headingParts: [("$1.2B", true), (" went unclaimed last year alone! 🚨", false)],
                    subtitle: "Most customers forget to claim their settlements.",
                    imageName: "settlement-unclaimed",
                    onNext: { state.step = .question(0) }
                )
            case .question(let index):
                QuestionScreen(
                    question: brandQuestions[index],
                    questionIndex: index,
                    totalQuestions: brandQuestions.count,
                    onAnswer: { answer in
                        state.answerQuestion(brandQuestions[index].id, answer: answer)
                        if index < brandQuestions.count - 1 {
                            state.step = .question(index + 1)
                        } else {
                            state.step = .loading
                        }
                    }
                )
            case .loading:
                LoadingScreen(onComplete: { state.step = .results })
            case .results:
                ResultsScreen(amount: state.missedAmount, onNext: { state.step = .unclaimable })
            case .unclaimable:
                UnclaimableScreen(amount: state.missedAmount, onNext: { state.step = .brands })
            case .brands:
                BrandsScreen(onGetStarted: { state.step = .chooseClaims })
            case .chooseClaims:
                ChooseClaimsScreen(state: state)
            case .form:
                FormScreen(state: state)
            case .claimForm:
                ClaimFormScreen(state: state)
            case .thankyou:
                ThankYouScreen()
            }
        }
        .animation(.easeInOut(duration: 0.2), value: "\(state.step)")
    }
}

extension AppStep: Equatable {
    static func == (lhs: AppStep, rhs: AppStep) -> Bool {
        "\(lhs)" == "\(rhs)"
    }
}
