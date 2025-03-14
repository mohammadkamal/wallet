import SwiftUI

struct ProfileIcon: View {
    var body: some View {
        Button(action: {}) {
            Image(systemName: "person.circle")
                .resizable()
                .background(.black)
                .foregroundStyle(.white)
                .scaledToFit()
                .frame(width: 35, height: 35)
                .clipShape(Circle())
                .accessibilityLabel("Your profile")
        }
    }
}

#Preview {
    ProfileIcon()
}
