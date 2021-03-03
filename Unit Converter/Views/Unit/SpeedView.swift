//
//  SpeedView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct SpeedView: View {
    var body: some View {
        ScrollView {
            VStack() {
                SpeedField(unitType: SpeedUnit.metres_sec)
                SpeedField(unitType: SpeedUnit.kilometres_hour)
                SpeedField(unitType: SpeedUnit.miles_hour)
                SpeedField(unitType: SpeedUnit.knot)
            }
            .padding(.top)
        }
        .navigationTitle("Speed")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedView()
    }
}
