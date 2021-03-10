import SwiftUI

struct HistoryView: View {
    @State var index = 0
    @EnvironmentObject var history: History
    
    var body: some View {
        VStack {
            generateHistory()
        }
    }
    
    func generateHistory() ->  AnyView {
        return
            AnyView(
                List {
                    ForEach(history.weight, id: \.self) { item in
                        Text(item)
                    }
                }
            )
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(History())
    }
}
