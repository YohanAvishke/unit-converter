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
                VStack {
                    Text("Weight")
                    List(history.weight, id: \.self) { item in
                        Text(item)
                    }
                    Text("Temperature")
                    List(history.temperature, id: \.self) { item in
                        Text(item)
                    }
                    Text("Distance")
                    List(history.distance, id: \.self) { item in
                        Text(item)
                    }
                    Text("Speed")
                    List(history.speed, id: \.self) { item in
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
