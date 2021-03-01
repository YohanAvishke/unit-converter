//
//  CteagoryItem.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-01.
//

import SwiftUI

struct CteagoryItem: View {
    var body: some View {
        HStack {
            Image("weight-light")
                .resizable()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            VStack() {
                Text("Weight")
                    .font(.title)
                Text("Units: grams, ounces, pounds, stone-pounds")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 40.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CteagoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CteagoryItem()
            .previewLayout(.fixed(width: 370, height: 100))
    }
}
