import SwiftUI

struct HistoryView: View {
    @State var index = 0
    @State var historyList: [String] = UserDefaults.standard.value(forKey: WEIGHTS_USER_DEFAULTS_KEY) as? [String] ?? []
    
    var body: some View {
        VStack {
            generateHistory()
        }
    }
    
    func generateHistory() ->  AnyView{
        return
            AnyView(
                List{
                    ForEach(historyList, id: \.self) { item in
                        Text(item)
                    }
                }
            )
    }
}

struct HistoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        HistoryView(historyList: UserDefaults.standard.value(forKey: WEIGHTS_USER_DEFAULTS_KEY) as? [String] ?? [])
    }
}
