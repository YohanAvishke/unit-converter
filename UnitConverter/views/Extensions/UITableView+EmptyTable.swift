//
//  UITableView+EmptyTable.swift
//  utility-converter
//
//  Created by Brion Silva on 09/04/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import Foundation
import UIKit

// MARK: - This extension cab be used to set empty state in uitable views.
extension UITableView {
    
    /// This function sets an empty message on the table view.
    func setEmptyMessage(_ message: String,_ messageColour: UIColor) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = messageColour
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "System", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    /// This function removes the empty message from the table view.
    func restore() {
        self.backgroundView = nil
    }
}
