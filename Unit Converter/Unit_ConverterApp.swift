import SwiftUI

@main
struct Unit_ConverterApp: App {
    @StateObject private var history = History()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(history)
        }
    }
}
