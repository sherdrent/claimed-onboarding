import SwiftUI

struct ResultsScreen: View {
    let amount: Int
    let onNext: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Text("💸")
                .font(.system(size: 48))

            Text("Based on your answers you missed out on...")
                .font(.system(size: 24, weight: .heavy))
                .italic()
                .multilineTextAlignment(.center)
                .foregroundColor(Theme.textPrimary)

            Text("$\(amount)")
                .font(.system(size: 56, weight: .black))
                .foregroundColor(Theme.textPrimary)

            Text("This is an approximation based on the payouts from the brands you selected")
                .font(.system(size: 14))
                .foregroundColor(Theme.textSecondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)

            Spacer()

            PrimaryButton(title: "Next", action: onNext)
                .padding(.horizontal, 16)
        }
        .padding(16)
    }
}

struct UnclaimableScreen: View {
    let amount: Int
    let onNext: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Text("⛔")
                .font(.system(size: 48))

            (Text("Unfortunately that ")
             + Text("$\(amount)").foregroundColor(Theme.accent)
             + Text(" is now unclaimable"))
                .font(.system(size: 24, weight: .heavy))
                .italic()
                .multilineTextAlignment(.center)
                .foregroundColor(Theme.textPrimary)

            Text("You missed the claim deadline. The claim windows are normally open for 3-12 months.")
                .font(.system(size: 14))
                .foregroundColor(Theme.textSecondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)

            Spacer()

            PrimaryButton(title: "Next", action: onNext)
                .padding(.horizontal, 16)
        }
        .padding(16)
    }
}

struct BrandsScreen: View {
    let onGetStarted: () -> Void

    private let brandImages = [
        "cvs", "wholefoods", "dailywire", "tmobile", "pepsi",
        "cashapp", "etsy", "fortnite-b", "apple-b", "tiktok-b",
        "gamestop", "fubo", "att", "amazon", "poppi", "neimanmarcus"
    ]

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(brandImages, id: \.self) { name in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            )
                            .rotationEffect(.degrees(Double.random(in: -15...15)))
                    }
                }
                .padding(20)
            }
            .frame(height: 280)

            VStack(spacing: 8) {
                Text("Plenty of active claims are still open!")
                    .font(.system(size: 24, weight: .heavy))
                    .italic()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Theme.textPrimary)

                Text("You still have time! Claimed will show you dozens of settlements available today.")
                    .font(.system(size: 14))
                    .foregroundColor(Theme.textSecondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 16)

            Spacer()

            PrimaryButton(title: "Get Started", action: onGetStarted)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
        }
    }
}

struct ThankYouScreen: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Text("🎉")
                .font(.system(size: 64))

            Text("You're all set!")
                .font(.system(size: 28, weight: .heavy))
                .foregroundColor(Theme.textPrimary)

            Text("Your claims have been submitted. We'll track them and notify you when payouts are available.")
                .font(.system(size: 14))
                .foregroundColor(Theme.textSecondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)

            Spacer()
        }
        .padding(16)
    }
}
