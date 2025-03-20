import SwiftUI

struct ServiceTransactionIcon: View {
    let type: TransactionType
    let imageUrl: URL?
    let category: TransactionCategory
    
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    init(type: TransactionType? = nil, imageUrl: URL? = nil, category: TransactionCategory? = nil, radius: CGFloat? = nil) {
        self.type = type ?? .unknown
        self.imageUrl = imageUrl
        self.category = category ?? .unknown
        
        self.width = radius == nil ? 50 : radius! * 2
        self.height = radius == nil ? 50 : radius! * 2
    }
    
    var body: some View {
        if imageUrl != nil
        {
            AsyncImage(url: imageUrl)
                .scaledToFit()
                .frame(width: width, height: width)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
        }
        else {
            IconBuilder(type: type, category: category, width: width, height: height)
        }
    }
}

private struct IconBuilder: View {
    let type: TransactionType
    let category: TransactionCategory
    
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    init(type: TransactionType? = nil, category: TransactionCategory? = nil, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.type = type ?? .unknown
        self.category = category ?? .unknown
        self.width = width ?? 50
        self.height = height ?? 50
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(icon())
                .resizable()
                .scaledToFit()
                .frame(width: width, height: width)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
            if type == .expense || type == .refund {
                TransactionArrow(incoming: type == .refund)
            }
        }
    }
    
    private func icon() -> String {
        return switch type {
        case .income, .outgoing, .unknown: ""
        case .cashback: "cashback_icon"
        case .expense, .refund: iconByCategory()
        default: ""
        }
    }
    
    private func iconByCategory() -> String {
        return switch category {
        case .shopping: "shopping_transaction_icon"
        case .transportation: "transport_icon"
        case .invoice: "invoice_icon"
        case .donation: "donation_icon"
        case .subscription: "subscription_icon"
        default: ""
        }
    }
}

#Preview {
    ServiceTransactionIcon(type: .expense, category: .subscription)
}
