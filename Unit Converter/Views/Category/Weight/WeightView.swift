//
//  WeightView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-02.
//

import SwiftUI

enum Unit {
    case kilogram
    case gram
    case ounce
    case pound
    case stone_pound
}

struct TextFieldWithLabel: View {
    var label: String
    var placeholder : String
    var unitType: Unit
    @State var ValueOfKilogram: String = ""
    @State var ValueOfGram: String = ""
    @State var ValueOfOunce: String = ""
    @State var ValueOfPound: String = ""
    @State var ValueOfStonePound: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(label)
            createUnitField(type: unitType)
        }
        .padding(.horizontal, 15)
    }
    
    func createUnitField(type: Unit) -> some View {
        switch type{
        case .kilogram:
            return createTextField(text: $ValueOfKilogram)
        case .gram:
            return createTextField(text: $ValueOfGram)
        case .ounce:
            return createTextField(text: $ValueOfOunce)
        case .pound:
            return createTextField(text: $ValueOfPound)
        case .stone_pound:
            return createTextField(text: $ValueOfStonePound)
        }
    }
    
    func createTextField(text: Binding<String>) -> some View {
        return TextField(placeholder, text: text)
            .padding(.all)
            .background(Color.white)
            .cornerRadius(10)
            .onChange(of: text.wrappedValue) { value in
                print(value)
            }
    }
}

struct WeightView: View {
    var body: some View {
        ScrollView {
            VStack() {
                TextFieldWithLabel(label:"Kilograms", placeholder:"Kg", unitType: Unit.kilogram)
                TextFieldWithLabel(label:"Grams", placeholder:"g", unitType: Unit.gram)
                TextFieldWithLabel(label:"Ounces", placeholder:"oz", unitType: Unit.ounce)
                TextFieldWithLabel(label:"Pounds", placeholder:"lb", unitType: Unit.pound)
                HStack {
                    TextFieldWithLabel(label:"Stones", placeholder:"st", unitType: Unit.stone_pound)
                    TextFieldWithLabel(label:"Pounds", placeholder:"lb", unitType: Unit.stone_pound)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Weight")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}
