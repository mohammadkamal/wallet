import SwiftUI

struct CurrentBalance: View {
    @State var showBalance : Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(showBalance ? "EGP 1,850.00" : "EGP ********")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    showBalance = !showBalance
                }) {
                    Image(systemName: showBalance ? "eye" : "eye.slash")
                        .foregroundStyle(.gray)
                }.accessibilityLabel(showBalance ? "Hide your balance" : "Show your balance")
                Text("Curent Balance")
                    .font(.headline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    CurrentBalance()
}
