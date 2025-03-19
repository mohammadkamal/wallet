enum TransactionCategory: Int, Codable {
    case account = 1
    case wallet = 2
    case shopping = 3
    case transportation = 4
    case invoice = 5
    case service = 6
    case donation = 7
    case subscription = 8
    
    case unknown = -1
}
