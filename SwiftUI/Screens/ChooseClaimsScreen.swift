import SwiftUI

struct ChooseClaimsScreen: View {
    @ObservedObject var state: AppState

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 0) {
                    ClaimedLogo()
                        .padding(.bottom, 16)

                    Text("Choose From These Claims")
                        .font(.system(size: 22, weight: .heavy))
                        .padding(.bottom, 8)

                    Text("You can always add more prior to the claim deadline.")
                        .font(.system(size: 14))
                        .foregroundColor(Theme.textSecondary)
                        .padding(.bottom, 20)

                    ForEach(claimItems) { claim in
                        ClaimCard(
                            claim: claim,
                            isSelected: state.selectedClaims.contains(claim.id),
                            onTap: { state.toggleClaim(claim.id) }
                        )
                    }
                }
                .padding(16)
                .padding(.bottom, state.selectedClaims.isEmpty ? 0 : 100)
            }

            if !state.selectedClaims.isEmpty {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(state.selectedClaims.count) selected")
                            .font(.system(size: 14))
                            .foregroundColor(Theme.textMuted)
                        Text("$\(state.totalPayout.formatted())")
                            .font(.system(size: 24, weight: .heavy))
                    }
                    Spacer()
                    Button(action: { state.step = .form }) {
                        Text("Next")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 120, height: 48)
                            .background(.black)
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
    }
}

struct ClaimCard: View {
    let claim: ClaimItem
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .top, spacing: 12) {
                Image(claim.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 92, height: 92)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                VStack(alignment: .leading, spacing: 2) {
                    Text(claim.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Theme.textPrimary)

                    Label("\(claim.daysLeft) days left", systemImage: "calendar")
                        .font(.system(size: 13))
                        .foregroundColor(Theme.textMuted)

                    Label(claim.who, systemImage: "person")
                        .font(.system(size: 13))
                        .foregroundColor(Theme.textMuted)

                    Label("Up to \(claim.payout)", systemImage: "pencil")
                        .font(.system(size: 13))
                        .foregroundColor(Theme.accent)
                        .fontWeight(.medium)
                }

                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isSelected ? Theme.accent : Theme.border, lineWidth: 2)
                        .frame(width: 20, height: 20)
                    if isSelected {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Theme.accent)
                            .frame(width: 20, height: 20)
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 2)
            }
            .padding(18)
            .background(isSelected ? Theme.accent.opacity(0.08) : .white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? Theme.accent : Color(hex: "E5E7EB"), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(.bottom, 12)
    }
}
