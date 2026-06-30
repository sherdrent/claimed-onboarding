import SwiftUI

struct FormScreen: View {
    @ObservedObject var state: AppState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Spacer()
                    ClaimedLogo()
                    Spacer()
                }
                .padding(.bottom, 16)

                Text("Fill out your details")
                    .font(.system(size: 22, weight: .heavy))
                    .padding(.bottom, 8)

                Text("We'll save your info to make claiming quick and easy. We'll reuse these details for all claims.")
                    .font(.system(size: 14))
                    .foregroundColor(Theme.textSecondary)
                    .lineSpacing(2)
                    .padding(.bottom, 16)

                Text("Selected claims")
                    .font(.system(size: 13))
                    .foregroundColor(Theme.textMuted)
                    .padding(.bottom, 8)

                FlowLayout(spacing: 8) {
                    ForEach(state.selectedClaimsList) { claim in
                        HStack(spacing: 4) {
                            Image(claim.iconName)
                                .resizable()
                                .frame(width: 16, height: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                            Text(claim.name)
                                .font(.system(size: 12, weight: .medium))
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(hex: "F0F0F0"))
                        .clipShape(Capsule())
                    }
                }
                .padding(.bottom, 24)

                Text("Claimant Information")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.bottom, 16)

                FormField(label: "First Name", required: true, text: $state.firstName)
                FormField(label: "Middle Name (optional)", text: $state.middleName)
                FormField(label: "Last Name (optional)", text: $state.lastName)
                FormField(label: "Email Address", required: true, text: $state.email, keyboard: .emailAddress)
                FormField(label: "Country (optional)", text: $state.country)
                FormField(label: "City (optional)", text: $state.city)
                FormField(label: "State (optional)", text: $state.state)
                FormField(label: "ZIP / Postal Code (optional)", text: $state.zip, keyboard: .numberPad)

                PrimaryButton(title: "Next", color: Theme.accent) {
                    state.currentClaimIndex = 0
                    state.step = .claimForm
                }
                .padding(.top, 8)
                .padding(.bottom, 24)
            }
            .padding(16)
        }
    }
}

struct FormField: View {
    let label: String
    var required: Bool = false
    @Binding var text: String
    var keyboard: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 2) {
                Text(label)
                    .font(.system(size: 14, weight: .semibold))
                if required {
                    Text("*")
                        .foregroundColor(Theme.red)
                }
            }
            TextField("", text: $text)
                .keyboardType(keyboard)
                .padding(.horizontal, 12)
                .frame(height: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Theme.border, lineWidth: 1)
                )
        }
        .padding(.bottom, 16)
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = layout(proposal: proposal, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = layout(proposal: proposal, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y), proposal: .unspecified)
        }
    }

    private func layout(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, positions: [CGPoint]) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth && x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            positions.append(CGPoint(x: x, y: y))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
        }

        return (CGSize(width: maxWidth, height: y + rowHeight), positions)
    }
}
