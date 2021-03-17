//
//  HistoryTableViewCel.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-17.
//

import Foundation
import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var data: UILabel!
}

class ConverterTableViewCell: UITableViewCell {
    @IBOutlet weak var converterImage: UIImageView!
    @IBOutlet weak var converterName: UILabel!
    @IBOutlet weak var converterDescription: UILabel!
}
