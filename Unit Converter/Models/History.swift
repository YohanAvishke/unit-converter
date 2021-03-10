import Foundation
import Combine

final class History: ObservableObject {
    
    @Published var weight: [String] {
        didSet {
            UserDefaults.standard.set(weight, forKey: "weight")
        }
    }
    
    init() {
        self.weight = UserDefaults.standard.object(forKey: "weight") as? [String] ?? []
    }
}
