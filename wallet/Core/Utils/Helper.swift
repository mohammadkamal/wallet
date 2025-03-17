class Helper {
    // Function to format the credit card number in groups of 4
    static func formatCreditCardNumber(_ number: String) -> String {
        let cleaned = number.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
        let grouped = stride(from: 0, to: cleaned.count, by: 4).map {
            let start = cleaned.index(cleaned.startIndex, offsetBy: $0)
            let end = cleaned.index(start, offsetBy: 4, limitedBy: cleaned.endIndex) ?? cleaned.endIndex
            return String(cleaned[start..<end])
        }
        return grouped.joined(separator: " ")
    }
}
