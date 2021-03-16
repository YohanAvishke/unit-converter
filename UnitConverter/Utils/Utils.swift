//
//  Utils.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-15.
//

import Foundation
import UIKit

/**
 Check if user has started to convert values
 
 - Parameter list: List of `textFields` that could be edited
 - Returns: A `true` if a `textField` is edited
 */
func isTextFieldsEmpty(list: [UITextField]) -> Bool {
    for field in list {
        if (field.text?.isEmpty)! {
            return true
        }
    }
    return false
}

/**
 Get the first responder in a `UIView`
 
 - Parameter inView: The corresponding `UIView`.
 - Returns: `UIView` or a sub `UIView` which is recognised as the first responder
 */
func getFirstResponder(inView view: UIView) -> UIView? {
    for subView in view.subviews {
        if subView.isFirstResponder {
            return subView
        }
        if let recursiveSubView = getFirstResponder(inView: subView) {
            return recursiveSubView
        }
    }
    return nil
}
