//
//  UITextField.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import UIKit

extension UITextField {
    
    /**
     Add placeholder, editing padding to the left of a `UITextField`
     
     - Parameters left: Decimal distance of padding from leading of `UITextField`
     */
    func setPaddingFor(left: CGFloat) {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0,
                                                   width: left,
                                                   height: self.frame.size.height))
        self.leftView = leftPaddingView
        self.leftViewMode = .always
    }
}
