import SwiftUI

struct ClaimedLogo: View {
    var size: CGFloat = 28

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Theme.red)
                .frame(width: size, height: size)
            Text("C")
                .font(.system(size: size * 0.64, weight: .heavy))
                .italic()
                .foregroundColor(.white)
        }
    }
}

struct PrimaryButton: View {
    let title: String
    var color: Color = .black
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(color)
                .clipShape(Capsule())
        }
    }
}

struct AnswerButton: View {
    let title: String
    var isSelected: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? .white : Theme.textPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 49)
                .background(isSelected ? Theme.accent : .white)
                .overlay(
                    Capsule()
                        .stroke(isSelected ? Theme.accent : Theme.border, lineWidth: 1)
                )
                .clipShape(Capsule())
        }
    }
}

struct YesNoButton: View {
    let title: String
    var isSelected: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Theme.accent)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(isSelected ? Theme.accent.opacity(0.15) : .white)
                .overlay(
                    Capsule()
                        .stroke(isSelected ? Theme.accent.opacity(0.5) : Theme.border, lineWidth: 1)
                )
                .clipShape(Capsule())
        }
    }
}

struct IntroHeading: View {
    let parts: [(String, Bool)]

    var body: some View {
        parts.reduce(Text("")) { result, part in
            result + Text(part.0)
                .foregroundColor(part.1 ? Theme.accent : Theme.textPrimary)
        }
        .font(.system(size: 26, weight: .heavy))
        .tracking(-0.728)
        .lineSpacing(2)
    }
}

struct QuestionCounter: View {
    let current: Int
    let total: Int

    var body: some View {
        Text("\(current)/\(total) questions")
            .font(.system(size: 12, weight: .semibold))
            .padding(.horizontal, 12)
            .padding(.vertical, 5)
            .background(Color(hex: "F0F0F0"))
            .clipShape(Capsule())
    }
}
