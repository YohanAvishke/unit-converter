//
//  LengthView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct LengthView: View {
    var body: some View {
        ScrollView {
            VStack() {
                LengthField(unitType: LengthtUnit.metre)
                LengthField(unitType: LengthtUnit.kilometre)
                LengthField(unitType: LengthtUnit.mile)
                LengthField(unitType: LengthtUnit.centimetre)
                LengthField(unitType: LengthtUnit.millimetre)
                LengthField(unitType: LengthtUnit.yard)
                LengthField(unitType: LengthtUnit.inch)
            }
            .padding(.top)
        }
        .navigationTitle("Length")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
