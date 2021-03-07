import SwiftUI

struct ClearButton: ViewModifier {
    @Binding var converterValue: ConverterValue
    
    func body(content: Content) -> some View {
        HStack {
            content
            Button(
                action: {
                    self.converterValue.clearAll()
                },
                label: {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
            )
        }
    }
}
