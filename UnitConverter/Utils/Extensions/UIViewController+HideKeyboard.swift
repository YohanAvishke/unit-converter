//
//  UIViewController+HideKeyboard.swift
//  utility-converter
//
//  Created by Brion Silva on 08/04/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

// MARK: - This extension can be used to hide keyboards.
extension UIViewController {
    
    /// This function Hides the keyboard when tapped on the view.
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    /// This function dismisses the keyboard from view.
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
