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
                NavigationLink(destination: WeightView()) {
                    CategoryItem(category: categories[0])
                }
                NavigationLink(destination: TemperatureView()) {
                    CategoryItem(category: categories[1])
                }
                NavigationLink(destination: LengthView()) {
                    CategoryItem(category: categories[2])
                }
                NavigationLink(destination: SpeedView()) {
                    CategoryItem(category: categories[3])
                }
                NavigationLink(destination: VolumeView()) {
                    CategoryItem(category: categories[4])
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
