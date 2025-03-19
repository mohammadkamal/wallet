enum TransactionType : Int, Codable {
    case income = 1
    case outgoing = 2
    case expense = 3
    case refund = 4
    case cashback = 5
    case walletCharge = 6
    
    case unknown = -1
}
