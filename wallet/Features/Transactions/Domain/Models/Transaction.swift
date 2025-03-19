import Foundation

class Transaction : Codable {
    let id: Int
    let amount: Double
    let label: String
    let date: Date?
    let type: TransactionType
    let category: TransactionCategory
    
    init(id: Int? = nil, amount: Double? = nil, label: String? = nil, date: Date?, type: TransactionType? = nil, category: TransactionCategory? = nil) {
        self.id = id ?? 0
        self.amount = amount ?? 0
        self.label = label ?? ""
        self.date = date
        self.type = type ?? .unknown
        self.category = category ?? .unknown
    }
}
