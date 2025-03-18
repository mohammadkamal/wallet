class CardModel : Codable {
    let id: Int
    let cardNumber: String?
    let startDigits: String
    let endDigits: String
    let expirationMonth: Int
    let expirationYear: Int
    let cvv: String?
    let cardHolder: String
    let bank: String?
    
    var type: CardType {
        return Helper.checkCardType(cardNumber ?? "")
    }
}
