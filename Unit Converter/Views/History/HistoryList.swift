import SwiftUI

struct HistoryList: View {
    var weight: [String]
    var converter: Converter
    
    var body: some View {
        List(weight, id: \.self) { data in
            HistoryItem(converter: converter, data: data)
        }
    }
}

struct HistoryList_Previews: PreviewProvider {
    static var previews: some View {
        HistoryList(weight: ["Test data"],converter: converters[0])
    }
}
