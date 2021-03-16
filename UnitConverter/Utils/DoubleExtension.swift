//
//  DoubleExtension.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
