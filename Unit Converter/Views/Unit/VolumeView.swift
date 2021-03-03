//
//  VolumeView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct VolumeView: View {
    var body: some View {
        ScrollView {
            VStack() {
                VolumeField(unitType: VolumeUnit.gallon)
                VolumeField(unitType: VolumeUnit.litre)
                VolumeField(unitType: VolumeUnit.pint)
                VolumeField(unitType: VolumeUnit.fluid_ounce)
                VolumeField(unitType: VolumeUnit.millilitre)
            }
            .padding(.top)
        }
        .navigationTitle("Volume")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}
