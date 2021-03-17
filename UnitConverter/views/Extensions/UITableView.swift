//
//  UITableView.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation
import UIKit

extension UITableView {
    
    /// Set a message if the `TableView` rows are empty
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width,
                                                 height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel;
    }
    
    /// Remove the empty message
    func restore() {
        self.backgroundView = nil
    }
}
