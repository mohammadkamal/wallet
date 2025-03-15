import SwiftUI

struct InsightsButton: View {
    var body: some View {
        Button(action: {}) {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    Image(systemName: "chart.bar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                        .padding(10)
                }
                Text("Insights")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    InsightsButton()
}
