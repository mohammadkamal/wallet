import SwiftUI

struct TransactionAmountLabel: View {
    let value: Double
    let type: TransactionType
    
    private var style: (any ShapeStyle)? = nil
    private var label: String = ""
    
    init(value: Double? = nil, type: TransactionType? = nil) {
        self.type = type ?? .unknown
        switch self.type {
        case .income:
            self.style = .blue
            self.label = "+ "
        case .outgoing:
            self.style = .red
            self.label = "- "
        default:
            self.style = .black
        }
        
        self.value = value ?? 0
    }
    
    var body: some View {
        Text("\(label)\(value, specifier: "%.2f") EGP")
            .foregroundStyle(style!)
    }
}

#Preview {
    TransactionAmountLabel()
}
