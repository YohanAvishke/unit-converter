//
//  HistoryTableViewCell.swift
//  utility-converter
//
//  Created by Brion Silva on 27/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var historyConversionText: UILabel!
    @IBOutlet weak var historyTypeIcon: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
}
