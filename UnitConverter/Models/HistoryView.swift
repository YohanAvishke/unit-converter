//
//  HistoryView.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import UIKit

class HistoryView {
    let type: String
    let icon: UIImage
    let conversion: String
    
    init(type: String, icon: UIImage, conversion: String) {
        self.type = type
        self.icon = icon
        self.conversion = conversion
    }
    
    func getHistoryType() -> String {
        return type
    }
    
    func getHistoryIcon() -> UIImage {
        return icon
    }
    
    func getHistoryConversion() -> String {
        return conversion
    }
}
