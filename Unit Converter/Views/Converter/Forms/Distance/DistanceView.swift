import SwiftUI

struct DistanceView: View {
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

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView()
    }
}
