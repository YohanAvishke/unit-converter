//
//  MenuView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-01.
//

import SwiftUI

struct CategoryList: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        CategoryItem(category: category) }
                }
            }
            .navigationTitle("Mass Units")
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
