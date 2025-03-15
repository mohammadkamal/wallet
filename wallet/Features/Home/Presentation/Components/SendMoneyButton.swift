import SwiftUI

struct SendMoneyButton: View {
    var body: some View {
        Button(action: {}) {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: 60, height: 60)
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(10)
                }
                Text("Send Money")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    SendMoneyButton()
}
