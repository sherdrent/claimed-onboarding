import SwiftUI

struct Theme {
    static let accent = Color(hex: "90D5FF")
    static let textPrimary = Color(hex: "121212")
    static let textSecondary = Color(hex: "98A2B3")
    static let textMuted = Color(hex: "667085")
    static let red = Color(hex: "EF4444")
    static let border = Color(hex: "D1D5DB")
    static let backgroundGray = Color(hex: "F5F5F5")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}
