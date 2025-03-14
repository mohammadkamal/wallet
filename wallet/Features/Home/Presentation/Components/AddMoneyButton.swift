import SwiftUI

struct AddMoneyButton: View {
    var body: some View {
        Button(action: {}) {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: 60, height: 60)
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(10)
                }
                Text("Add Money")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    AddMoneyButton()
}
