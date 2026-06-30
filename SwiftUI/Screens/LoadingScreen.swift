import SwiftUI

struct LoadingScreen: View {
    let onComplete: () -> Void
    @State private var pulse = false

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            Text("🌐")
                .font(.system(size: 32))
                .padding(16)
                .background(Color(hex: "F0F4FF"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .scaleEffect(pulse ? 1.05 : 1.0)
                .opacity(pulse ? 0.8 : 1.0)
                .animation(.easeInOut(duration: 1.5).repeatForever(), value: pulse)

            Text("Calculating your estimated ") + Text("payout").foregroundColor(Theme.accent)

            Text("Running payout optimization")
                .font(.system(size: 14))
                .foregroundColor(Theme.textSecondary)
                .opacity(pulse ? 1.0 : 0.4)
                .animation(.easeInOut(duration: 2).repeatForever(), value: pulse)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            pulse = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                onComplete()
            }
        }
    }
}
