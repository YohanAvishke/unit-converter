import Foundation
import UIKit

struct Converter: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    
    private var imageName: String
    var image: UIImage {
        UIImage(named: imageName)!
    }
    
    var segueID: String
}
