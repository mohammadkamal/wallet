import SwiftUI

struct TransferTransactionIcon: View {
    let imageUrl: URL?
    let gender: Gender
    let incoming: Bool?
    
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    init(imageUrl: URL? = nil, radius: CGFloat? = nil, gender: Gender? = nil, incoming: Bool? = nil) {
        self.imageUrl = imageUrl
        self.gender = gender ?? Gender.unknown
        
        width = radius == nil ? 50 : radius! * 2
        height = radius == nil ? 50 : radius! * 2
        self.incoming = incoming
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if imageUrl != nil
            {
                AsyncImage(url: imageUrl)
                    .scaledToFit()
                    .frame(width: width, height: width)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
            }
            else {
                Image(gender == .female ? "transaction_female_avatar_placeholder" : "transaction_male_avatar_placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: width)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
            }
            if incoming != nil
            {
                TransactionArrow(incoming: incoming!)
            }
        }
    }
}

#Preview {
    TransferTransactionIcon(incoming: true)
}
