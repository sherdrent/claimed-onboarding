import SwiftUI

enum AppStep {
    case intro1, intro2, intro3, intro4, intro5
    case question(Int)
    case loading
    case results
    case unclaimable
    case brands
    case chooseClaims
    case form
    case claimForm
    case thankyou
}

class AppState: ObservableObject {
    @Published var step: AppStep = .intro1
    @Published var answers: [String: String] = [:]
    @Published var selectedClaims: Set<String> = []
    @Published var firstName = ""
    @Published var middleName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var country = "United States"
    @Published var city = ""
    @Published var state = ""
    @Published var zip = ""
    @Published var currentClaimIndex = 0
    @Published var claimAnswers: [String: [Int: String]] = [:]

    var yesCount: Int {
        answers.values.filter { $0 == "yes" }.count
    }

    var missedAmount: Int {
        yesCount * payoutPerYes
    }

    var totalPayout: Int {
        selectedClaims.reduce(0) { sum, id in
            sum + (claimItems.first { $0.id == id }?.payoutValue ?? 0)
        }
    }

    var selectedClaimsList: [ClaimItem] {
        let ids = Array(selectedClaims)
        return ids.compactMap { id in claimItems.first { $0.id == id } }
    }

    func answerQuestion(_ questionId: String, answer: String) {
        answers[questionId] = answer
    }

    func toggleClaim(_ id: String) {
        if selectedClaims.contains(id) {
            selectedClaims.remove(id)
        } else {
            selectedClaims.insert(id)
        }
    }

    func answerClaimQuestion(claimId: String, questionIndex: Int, answer: String) {
        if claimAnswers[claimId] == nil {
            claimAnswers[claimId] = [:]
        }
        claimAnswers[claimId]?[questionIndex] = answer
    }
}
