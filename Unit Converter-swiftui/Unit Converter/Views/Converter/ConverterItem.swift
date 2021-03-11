import SwiftUI

struct ConverterItem: View {
    var converter: Converter
    
    var body: some View {
        HStack {
            converter.image
                .resizable()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            VStack {
                Text(converter.name)
                    .font(.title2)
                Text(converter.description)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            .frame(width: 180)
        }
        .padding(.horizontal)
    }
}

struct ConverterItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(converters) { converter in
                ConverterItem(converter: converter)
            }
        }
        .previewLayout(.fixed(width: 370, height: 100))
    }
}
