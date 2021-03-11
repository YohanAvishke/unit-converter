import Foundation

enum DistanceType {
    case mile
    case kilometre
    case metre
    case yard
    case inch
    case centimetre
    case millimetre
}

struct ValueOfDistance {
    var metre = ""
    var kilometre = ""
    var mile = ""
    var centimetre = ""
    var millimetre = ""
    var yard = ""
    var inch = ""
    
    mutating func clearAll() {
        metre = ""
        kilometre = ""
        mile = ""
        centimetre = ""
        millimetre = ""
        yard = ""
        inch = ""
    }
}

struct DistanceEditor {
    var metre: Bool
    var kilometre: Bool
    var mile: Bool
    var centimetre: Bool
    var millimetre: Bool
    var yard: Bool
    var inch: Bool
    
    init() {
        self.metre = false
        self.kilometre = false
        self.mile = false
        self.centimetre = false
        self.millimetre = false
        self.yard = false
        self.inch = false
    }
}
