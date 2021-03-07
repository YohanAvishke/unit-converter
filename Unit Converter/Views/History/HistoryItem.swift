import SwiftUI

struct HistoryItem: View {
    var body: some View {
        HStack {
            Image("weight-light")
                .resizable()
                .frame(width: 80, height: 80)
            
            Text("Conversion data")
                .font(.footnote)
                .padding(.leading)
            
            Spacer()
        }
    }
}

struct HistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HistoryItem()
            HistoryItem()
            HistoryItem()
        }
    }
}
