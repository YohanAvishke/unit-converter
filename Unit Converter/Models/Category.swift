//
//  Category.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-01.
//

import Foundation
import SwiftUI

struct Category: Hashable, Codable {
    var name: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}
