import SwiftUI

enum TabBar {
    case convert
    case history
}

struct ContentView: View {
    @State private var selection: TabBar = .convert
    
    var body: some View {
        TabView(selection: $selection) {
            ConverterList()
                .tabItem {
                    Label("Convert", systemImage: "arrow.2.squarepath")
                }
                .tag(TabBar.convert)
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
                .tag(TabBar.history)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
