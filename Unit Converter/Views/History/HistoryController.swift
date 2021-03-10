import SwiftUI

struct HistoryController: View {
    @State private var selection: ConverterType = .weight
    @EnvironmentObject var history: History
    
    var body: some View {
        TabView(selection: $selection) {
            HistoryList(weight: history.weight, converter: converters[0])
                .tabItem {
                    Label("Weight", systemImage: "arrow.2.squarepath")
                }
                .tag(ConverterType.weight)
            
            HistoryList(weight: history.temperature, converter: converters[1])
                .tabItem {
                    Label("Temperature", systemImage: "arrow.2.squarepath")
                }
                .tag(ConverterType.temperature)
            
            HistoryList(weight: history.distance, converter: converters[2])
                .tabItem {
                    Label("Distance", systemImage: "arrow.2.squarepath")
                }
                .tag(ConverterType.distance)
            
            HistoryList(weight: history.speed, converter: converters[3])
                .tabItem {
                    Label("Speed", systemImage: "arrow.2.squarepath")
                }
                .tag(ConverterType.speed)
            
            HistoryList(weight: history.volume, converter: converters[4])
                .tabItem {
                    Label("Volume", systemImage: "arrow.2.squarepath")
                }
                .tag(ConverterType.volume)
        }
    }
}

struct HistoryController_Previews: PreviewProvider {
    static var previews: some View {
        HistoryController()
            .environmentObject(History())
    }
}
