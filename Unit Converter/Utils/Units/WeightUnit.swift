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
    
    mutating func clearAll() {
        kilogram = ""
        gram = ""
        ounce = ""
        pound = ""
        stone = ""
        stonePound = ""
    }
}

struct WeightEditor {
    var kilogram: Bool
    var gram: Bool
    var ounce: Bool
    var pound: Bool
    var stone: Bool
    var stonePound: Bool
    
    init() {
        kilogram = false
        gram = false
        ounce = false
        pound = false
        stone = false
        stonePound = false
    }
}
