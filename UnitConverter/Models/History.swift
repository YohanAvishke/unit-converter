//
//  History.swift
//  utility-converter
//
//  Created by Brion Silva on 27/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class History {
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
