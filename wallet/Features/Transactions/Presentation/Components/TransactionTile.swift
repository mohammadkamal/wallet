import SwiftUI

struct TransactionTile: View {
    let image: String? = nil
    let label: String?
    let value: Double
    let type: TransactionType?
    let date: Date?
    
    private var dateLabel: String? = nil
    
    init(value: Double = 0, type: TransactionType? = nil, label: String? = nil, image: String? = nil, date: Date? = nil) {
        self.value = value
        self.type = type
        self.label = label
        self.date = date
        if(date != nil) {
            let formatter = DateFormatter()
            formatter.dateFormat = "mm:ss"
            self.dateLabel = formatter.string(from: date!)
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(label ?? "Transaction")
                if (date != nil) {
                    Text("\(dateLabel!)").font(.caption).foregroundStyle(.gray)
                }
                
            }
            Spacer()
            TransactionAmount(value: value, type: type)
        }
    }
}


private struct TransactionAmount: View {
    let value: Double
    let type: TransactionType? = nil
    
    private var style: (any ShapeStyle)? = nil
    private var label: String = ""
    
    init(value: Double, type: TransactionType? = nil) {
        switch type {
        case .income?:
            self.style = .blue
            self.label = "+ "
        case .outgoing?:
            self.style = .red
            self.label = "- "
        default:
            self.style = .black
        }
        
        self.value = value
    }
    
    var body: some View {
        Text("\(label)\(value, specifier: "%.2f") EGP")
            .foregroundStyle(style!)
    }
}

#Preview {
    TransactionTile(value: 0, type: .income, date: Date())
}
