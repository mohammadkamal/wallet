import Foundation

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
    
    static func checkCardType(_ cardNumber: String) -> CardType {
        let visaRegEx = "^4[0-9]{12}(?:[0-9]{3})?$"
        let masterCardRegEx = "^5[1-5][0-9]{14}$|^2(2[2-9][1-9][0-9]{2}|2[3-9][0-9]{3}|[3-6][0-9]{4}|7[0-1][0-9]{3}|720[0-9]{2})[0-9]{10}$"
        let meezaRegEx = "^5078[0-9]{12}$"
        
        let isVisa = NSPredicate(format: "SELF MATCHES %@", visaRegEx).evaluate(with: cardNumber)
        let isMasterCard = NSPredicate(format: "SELF MATCHES %@", masterCardRegEx).evaluate(with: cardNumber)
        let isMeeza = NSPredicate(format: "SELF MATCHES %@", meezaRegEx).evaluate(with: cardNumber)
        
        if isVisa {
            return .visa
        } else if isMasterCard {
            return .masterCard
        } else if isMeeza {
            return .meeza
        } else {
            return .unknown
        }
    }
}
