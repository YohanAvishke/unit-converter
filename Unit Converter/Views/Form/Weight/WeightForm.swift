import SwiftUI

let WEIGHTS_USER_DEFAULTS_KEY = "weight"
private let WEIGHTS_USER_DEFAULTS_MAX_COUNT = 5

struct WeightForm: View {
    @State private var converterValue = ConverterValue()
    
    var body: some View {
        ScrollView {
            VStack {
                WeightField(unitType: .kilogram, converterValue: $converterValue)
                WeightField(unitType: .gram, converterValue: $converterValue)
                WeightField(unitType: .ounce, converterValue: $converterValue)
                WeightField(unitType: .pound, converterValue: $converterValue)
                HStack {
                    WeightField(unitType: .stone, converterValue: $converterValue)
                    WeightField(unitType: .stone_pound, converterValue: $converterValue)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Weight")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(
                action: {
                    saveWeight()
                },
                label: {
                    Image("save(24x24)")
                }
            )
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func saveWeight() {
        let weightValues = converterValue.weight
        let conversion = "\(weightValues.kilogram) kg = \(weightValues.gram) g = \(weightValues.ounce) oz =  \(weightValues.pound) lb = \(weightValues.stone) stones & \(weightValues.stonePound) pounds"
        var arr = UserDefaults.standard.array(forKey: WEIGHTS_USER_DEFAULTS_KEY) as? [String] ?? []
        
        if arr.count >= WEIGHTS_USER_DEFAULTS_MAX_COUNT {
            arr = Array(arr.suffix(WEIGHTS_USER_DEFAULTS_MAX_COUNT - 1))
        }
        arr.append(conversion)
        UserDefaults.standard.set(arr, forKey: WEIGHTS_USER_DEFAULTS_KEY)
        print("Saved \(conversion)")
    }
}

struct WeightForm_Previews: PreviewProvider {
    static var previews: some View {
        WeightForm()
    }
}
