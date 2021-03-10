import SwiftUI

struct HistoryItem: View {
    var converter: Converter
    var data: String
    
    var body: some View {
        HStack {
            converter.image
                .resizable()
                .frame(width: 80, height: 80)
            
            Text(data)
                .font(.footnote)
                .padding(.leading)
            
            Spacer()
        }
    }
}

struct HistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HistoryItem(converter: converters[0], data: "Test data")
        }
    }
}
