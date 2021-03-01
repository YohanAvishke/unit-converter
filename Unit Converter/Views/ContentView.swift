//
//  ContentView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-02-25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .units
    
    enum Tab {
        case units
        case history
        case constatnts
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryList()
                .tabItem {
                    Label("Convert", systemImage: "arrow.2.squarepath")
                }
                .tag(Tab.units)
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
                .tag(Tab.history)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
