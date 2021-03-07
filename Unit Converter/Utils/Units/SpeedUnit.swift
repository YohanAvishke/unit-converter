import Foundation

enum SpeedType {
    case knot
    case miles_hour
    case kilometres_hour
    case metres_sec
}

struct ValueOfSpeed {
    var metresPerSecond = ""
    var kilometresPerHour = ""
    var milesPerHour = ""
    var knot = ""
}

struct SpeedEditor {
    var metresPerSecond: Bool
    var kilometresPerHour: Bool
    var milesPerHour: Bool
    var knot: Bool
    
    init() {
        self.metresPerSecond = false
        self.kilometresPerHour = false
        self.milesPerHour = false
        self.knot = false
    }
}
