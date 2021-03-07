import Foundation

enum VolumeType {
    case gallon
    case litre
    case pint
    case fluid_ounce
    case millilitre
}

struct ValueOfVolume {
    var gallon = ""
    var litre = ""
    var pint = ""
    var fluidOunce = ""
    var millilitre = ""
}

struct VolumeEditor {
    var gallon: Bool
    var litre: Bool
    var pint: Bool
    var fludOunce: Bool
    var millilitre: Bool
    
    init() {
        self.gallon = false
        self.litre = false
        self.pint = false
        self.fludOunce = false
        self.millilitre = false
    }
}
