import SwiftUI

struct CardsView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CardComponent(cardNumber: "4200000000000000", expirationDate: "12/24", cardHolder: "Jack Sparrow")
                    CardComponent(cardNumber: "5078000000000000", expirationDate: "12/24", cardHolder: "Muhammad Ahmad")
                }
                .padding([.leading, .trailing])
            }
            Spacer()
            Button(action: {}) {
                Text("Add Card")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
            }
        }
    }
}

#Preview {
    CardsView()
}
