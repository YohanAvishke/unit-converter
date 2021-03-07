import Foundation

enum WeightType {
    case kilogram
    case gram
    case ounce
    case pound
    case stone
    case stone_pound
}

struct ValueOfWeight {
    var kilogram: String = ""
    var gram: String = ""
    var ounce: String = ""
    var pound: String = ""
    var stone: String = ""
    var stonePound: String = ""
}

struct WeightEditor {
    var kilogram: Bool
    var gram: Bool
    var ounce: Bool
    var pound: Bool
    var stone: Bool
    var stonePound: Bool
    
    init() {
        self.kilogram = false
        self.gram = false
        self.ounce = false
        self.pound = false
        self.stone = false
        self.stonePound = false
    }
}
