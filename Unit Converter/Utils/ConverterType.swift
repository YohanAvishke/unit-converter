import Foundation

enum ConverterType: String {
    case weight = "Weight"
    case temperature = "Temperature"
    case distance = "Distance"
    case speed = "Speed"
    case volume = "Volume"
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
