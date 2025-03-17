import SwiftUI

struct CardComponent: View {
    let cardNumber: String
    let bankName: String?
    let expirationDate: String
    let cvv: String
    let cardHolder: String
    
    init(cardNumber: String, expirationDate: String, cvv: String, cardHolder: String, bankName: String? = nil) {
        self.cardNumber = cardNumber
        self.expirationDate = expirationDate
        self.cvv = cvv
        self.cardHolder = cardHolder
        self.bankName = bankName
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(bankName ?? "")
                Spacer()
                Image("icon-contactless-reverse")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
            }
            .padding()
            Text(Helper.formatCreditCardNumber(cardNumber))
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.bold)
                .padding([.leading, .trailing])
            HStack {
                Text("Valid\nThru".uppercased())
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding([.trailing])
                Text(expirationDate)
                    .foregroundStyle(.white)
                    .font(.callout)
                    .fontWeight(.bold)
            }.padding([.leading, .trailing])
            HStack {
                Text(cardHolder.uppercased())
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
        }
        .background(Color.black)
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 2))
        .shadow(radius: 5)
    }
}

#Preview {
    CardComponent(cardNumber: "4200000000000000", expirationDate: "07/29", cvv: "123", cardHolder: "John Doe")
}
