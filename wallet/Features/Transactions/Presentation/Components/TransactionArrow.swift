import SwiftUI

struct TransactionArrow: View {
    let incoming: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
            Image(systemName: incoming ? "arrow.left" : "arrow.right")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundStyle(.white)
                .clipShape(Circle())
        }
    }
}

#Preview {
    TransactionArrow(incoming: true)
}
