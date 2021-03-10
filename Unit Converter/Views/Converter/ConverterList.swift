import SwiftUI

struct ConverterList: View {
    var body: some View {
        NavigationView {
            List(converters) { converter in
                NavigationLink(destination: FormController(
                    converterType: ConverterType(rawValue: converter.name)!
                )) {
                    ConverterItem(converter: converter)
                }
            }
            .navigationTitle("Convert")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ConverterList_Previews: PreviewProvider {
    static var previews: some View {
        ConverterList()
    }
}
