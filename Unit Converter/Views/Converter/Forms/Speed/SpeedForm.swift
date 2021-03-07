import SwiftUI

struct SpeedForm: View {
    @State private var valueOfSpeed = ValueOfSpeed()
    
    var body: some View {
        ScrollView {
            VStack() {
                SpeedField(unitType: .metres_sec,
                           valueOfSpeed: self.$valueOfSpeed)
                SpeedField(unitType: .knot,
                           valueOfSpeed: self.$valueOfSpeed)
                SpeedField(unitType: .miles_hour,
                           valueOfSpeed: self.$valueOfSpeed)
                SpeedField(unitType: .kilometres_hour,
                           valueOfSpeed: self.$valueOfSpeed)
            }
            .padding(.top)
        }
        .navigationTitle("Speed")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SpeedForm_Previews: PreviewProvider {
    static var previews: some View {
        SpeedForm()
    }
}
