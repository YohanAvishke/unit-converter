import Foundation
import SwiftUI

struct Converter: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
