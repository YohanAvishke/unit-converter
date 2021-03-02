//
//  CteagoryItem.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-01.
//

import SwiftUI

struct CategoryItem: View {
    var category: Category
    
    var body: some View {
        HStack {
            category.image
                .resizable()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            VStack() {
                Text(category.name)
                    .font(.title)
                Text(category.description)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}

struct CteagoryItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(categories, id: \.self) { category in
                CategoryItem(category: category)
            }
        }
        .previewLayout(.fixed(width: 370, height: 100))
    }
}
