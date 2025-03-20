import SwiftUI

struct TransactionTile: View {
    let label: String
    let value: Double
    let type: TransactionType
    let date: Date?
    let imageURL: URL?
    let gender: Gender
    let category: TransactionCategory
    
    private var dateLabel: String? = nil
    
    init(value: Double = 0, type: TransactionType? = nil, label: String? = nil, image: String? = nil, date: Date? = nil, imageUrl: URL? = nil, gender: Gender? = nil, category: TransactionCategory? = nil) {
        self.value = value
        self.type = type ?? .unknown
        self.label = label ?? "Transaction"
        self.date = date
        if(date != nil) {
            let formatter = DateFormatter()
            formatter.dateFormat = "mm:ss"
            self.dateLabel = formatter.string(from: date!)
        }
        self.imageURL = imageUrl
        self.gender = gender ?? .unknown
        self.category = category ?? .unknown
    }
    
    var body: some View {
        HStack {
            IconBuilder(type: type, imageUrl: imageURL, gender: gender, category: category)
            VStack(alignment: .leading) {
                Text(label)
                if (date != nil) {
                    Text("\(dateLabel!)").font(.caption).foregroundStyle(.gray)
                }
                
            }
            Spacer()
            TransactionAmountLabel(value: value, type: type)
        }
    }
}

private struct IconBuilder: View {
    let type: TransactionType
    let imageUrl: URL?
    let gender: Gender
    let category: TransactionCategory
    
    init(type: TransactionType? = nil, imageUrl: URL?, gender: Gender? = nil, category: TransactionCategory? = nil) {
        self.type = type ?? .unknown
        self.imageUrl = imageUrl
        self.gender = gender ?? .unknown
        self.category = category ?? .unknown
    }
    
    var body: some View {
        switch type {
        case .income, .outgoing:
            TransferTransactionIcon(imageUrl: imageUrl, gender: gender, incoming: type == .income)
        case .cashback, .expense, .refund:
            ServiceTransactionIcon(type: type, imageUrl: imageUrl, category: category)
        default:
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(Circle())
        }
    }
}

#Preview {
    TransactionTile(value: 0, type: .expense, date: Date(), category: .shopping)
}
