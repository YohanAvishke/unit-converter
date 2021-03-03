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
                ForEach(categories) { category in
                    NavigationLink(destination: WeightView()) {
                        CategoryItem(category: category) }
                }
            }
            .navigationTitle("Mass Units")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
