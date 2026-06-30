import SwiftUI

struct IntroScreen: View {
    let headingParts: [(String, Bool)]
    let subtitle: String
    let imageName: String
    let onNext: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ClaimedLogo()
                .padding(.bottom, 12)

            IntroHeading(parts: headingParts)
                .padding(.bottom, 12)

            Text(subtitle)
                .font(.system(size: 14))
                .tracking(-0.24)
                .lineSpacing(2)
                .foregroundColor(Theme.textSecondary)
                .padding(.bottom, 20)

            Spacer()

            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)

            Spacer()

            PrimaryButton(title: "Next", action: onNext)
                .padding(.top, 20)
        }
        .padding(16)
    }
}
