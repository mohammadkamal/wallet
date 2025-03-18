import SwiftUICore

enum CardType {
    case masterCard
    case visa
    case meeza
    
    case unknown
    
    @ViewBuilder
    var icon: some View {
        switch self {
        case .masterCard:
            Image("mastercard")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
        case .visa:
            Image("visa")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
        case .meeza:
            Image("meeza")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
        default:
            EmptyView()
        }
    }
}


