//
//  SpeedConversionViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import UIKit

let SPEED_USER_DEFAULTS_KEY = "speed"
private let SPEED_USER_DEFAULTS_MAX_COUNT = 5

class SpeedConversionViewController: UIViewController, CustomNumericKeyboardDelegate {
    
    @IBOutlet weak var speedViewScroller: UIScrollView!
    @IBOutlet weak var outerStackView: UIStackView!
    @IBOutlet weak var outerStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var msTextField: UITextField!
    @IBOutlet weak var msTextFieldStackView: UIStackView!
    @IBOutlet weak var kmhTextField: UITextField!
    @IBOutlet weak var kmhTextFieldStackView: UIStackView!
    @IBOutlet weak var mihTextField: UITextField!
    @IBOutlet weak var mihTextFieldStackView: UIStackView!
    @IBOutlet weak var knTextField: UITextField!
    @IBOutlet weak var knTextFieldStackView: UIStackView!
    
    var activeTextField = UITextField()
    var outerStackViewTopConstraintDefaultHeight: CGFloat = 17.0
    var textFieldKeyBoardGap = 20
    var keyBoardHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide)))
        
        if isTextFieldsEmpty() {
            self.navigationItem.rightBarButtonItem!.isEnabled = false;
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set Text Field Styles
        msTextField.setAsNumericKeyboard(delegate: self)
        
        kmhTextField.setAsNumericKeyboard(delegate: self)
        
        mihTextField.setAsNumericKeyboard(delegate: self)
        
        knTextField.setAsNumericKeyboard(delegate: self)
        
        // ad an observer to track keyboard show event
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    /// This function will be called by the tap gesture
    /// rrecognizer and will hide the keyboard and restore
    /// the top constrant back to default.
    @objc func keyboardWillHide() {
        view.endEditing(true)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.outerStackViewTopConstraint.constant = self.outerStackViewTopConstraintDefaultHeight
            self.view.layoutIfNeeded()
        })
    }
    
    /// This function will recognize the first responder
    /// and will adjust the ui text field position according
    /// to the height of the keyboard. The scroll will is adjusted
    /// inorder to reach bottom text fields.
    ///
    /// Usage:
    ///
    ///     keyboardWillShow(notification:)
    ///
    /// - Parameter NSNotification: notification.
    @objc func keyboardWillShow(notification: NSNotification) {
        
        let firstResponder = self.findFirstResponder(inView: self.view)
        
        if firstResponder != nil {
            activeTextField = firstResponder as! UITextField;
            
            let activeTextFieldSuperView = activeTextField.superview!
            
            if let info = notification.userInfo {
                let keyboard:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
                
                let targetY = view.frame.size.height - keyboard.height - 15 - activeTextField.frame.size.height
                
                let initialY = outerStackView.frame.origin.y + activeTextFieldSuperView.frame.origin.y + activeTextField.frame.origin.y
                
                if initialY > targetY {
                    let diff = targetY - initialY
                    let targetOffsetForTopConstraint = outerStackViewTopConstraint.constant + diff
                    self.view.layoutIfNeeded()
                    
                    UIView.animate(withDuration: 0.25, animations: {
                        self.outerStackViewTopConstraint.constant = targetOffsetForTopConstraint
                        self.view.layoutIfNeeded()
                    })
                }
                
                var contentInset:UIEdgeInsets = self.speedViewScroller.contentInset
                contentInset.bottom = keyboard.size.height
                speedViewScroller.contentInset = contentInset
            }
        }
    }
    
    /// This function finds the first responder in a UIView.
    ///
    /// Usage:
    ///
    ///     let firstResponder = self.findFirstResponder(inView: self.view)
    ///
    /// - Parameter inView: The corresponding UIView.
    ///
    /// - Returns: A UIView or a subview will be returned.
    func findFirstResponder(inView view: UIView) -> UIView? {
        for subView in view.subviews {
            if subView.isFirstResponder {
                return subView
            }
            
            if let recursiveSubView = self.findFirstResponder(inView: subView) {
                return recursiveSubView
            }
        }
        
        return nil
    }
    
    /// This function is fired when the text fields are changed. This is a genric
    /// function and it Listens to the editing changed event of text fields.
    ///
    /// - Warning: The tags have been set in the storyboard to make the function generic.
    ///
    /// - Parameter textField: The changed text field.
    @IBAction func handleTextFieldChange(_ textField: UITextField) {
        var unit: SpeedUnit?
        
        if textField.tag == 1 {
            unit = SpeedUnit.ms
        } else if textField.tag == 2 {
            unit = SpeedUnit.kmh
        } else if textField.tag == 3 {
            unit = SpeedUnit.mih
        } else if textField.tag == 4 {
            unit = SpeedUnit.kn
        }
        
        if unit != nil {
            updateTextFields(textField: textField, unit: unit!)
        }
        
        if isTextFieldsEmpty() {
            self.navigationItem.rightBarButtonItem!.isEnabled = false;
        } else {
            self.navigationItem.rightBarButtonItem!.isEnabled = true;
        }
    }
    
    /// This function handles the saving of conversions on to the userdefaults.
    /// Only 5 conversions will be saved under each type.
    /// It checks if the text fields are filled and saves the conversion in user
    /// defaults and if the text fields aren't empty an alert will be shown.
    ///
    /// - Parameter sender: The navigation button item.
    @IBAction func handleSaveButtonClick(_ sender: UIBarButtonItem) {
        if !isTextFieldsEmpty() {
            let conversion = "\(msTextField.text!) ms/s = \(kmhTextField.text!) km/h = \(mihTextField.text!) mi/h = \(knTextField.text!) knots"
            
            var arr = UserDefaults.standard.array(forKey: SPEED_USER_DEFAULTS_KEY) as? [String] ?? []
            
            if arr.count >= SPEED_USER_DEFAULTS_MAX_COUNT {
                arr = Array(arr.suffix(SPEED_USER_DEFAULTS_MAX_COUNT - 1))
            }
            arr.append(conversion)
            UserDefaults.standard.set(arr, forKey: SPEED_USER_DEFAULTS_KEY)
            
            let alert = UIAlertController(title: "Success", message: "The speed conversion was successully saved!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "You are trying to save an empty conversion!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /// This is a reusable utility function to check if the text fields are empty.
    ///
    /// - Warning: This function needs to be changed when a new text field is added or removed.
    ///
    /// Usage:
    ///
    ///     if isTextFieldsEmpty() // true | false
    ///
    /// - Returns: true or false
    func isTextFieldsEmpty() -> Bool {
        if !(msTextField.text?.isEmpty)! && !(kmhTextField.text?.isEmpty)! &&
            !(mihTextField.text?.isEmpty)! && !(knTextField.text?.isEmpty)!{
            return false
        }
        return true
    }
    
    /// This function modifies all the text fields accordingly based on the changed text field.
    ///
    /// Usage:
    ///
    ///     updateTextFields(textField: textField, unit: unit!)
    ///
    /// - Parameter textField: The changed text field.
    ///             unit: The temperature unit of the changed text field.
    func updateTextFields(textField: UITextField, unit: SpeedUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                if let value = Double(input as String) {
                    let speed = Speed(unit: unit, value: value)
                    
                    for _unit in SpeedUnit.getAllUnits {
                        if _unit == unit {
                            continue
                        }
                        let textField = mapUnitToTextField(unit: _unit)
                        let result = speed.convert(unit: _unit)
                        
                        //rounding off to 4 decimal places
                        let roundedResult = Double(round(10000 * result) / 10000)
                        
                        textField.text = String(roundedResult)
                    }
                }
            }
        }
    }
    
    /// This function maps the respective temperature unit to the respective UITextField.
    ///
    /// Usage:
    ///
    ///     let textField = mapUnitToTextField(unit: _unit)
    ///
    /// - Parameter unit: The temperature unit.
    ///
    /// - Returns: A UITextField corresponding to the temperature unit.
    func mapUnitToTextField(unit: SpeedUnit) -> UITextField {
        var textField = msTextField
        switch unit {
        case .ms:
            textField = msTextField
        case .kmh:
            textField = kmhTextField
        case .mih:
            textField = mihTextField
        case .kn:
            textField = knTextField
        }
        return textField!
    }
    
    /// This function clears all the text fields
    func clearTextFields() {
        msTextField.text = ""
        kmhTextField.text = ""
        mihTextField.text = ""
        knTextField.text = ""
    }
    
    /// This function is a part of the CustomNumericKeyboardDelegate interface
    /// and will be triggered when the retract button is pressed on the custom keyboard.
    func retractKeyPressed() {
        keyboardWillHide()
    }
    
    /// This function is a part of the CustomNumericKeyboardDelegate interface
    /// and will be triggered when the numeric buttons are pressed on the custom keyboard.
    func numericKeyPressed(key: Int) {
        print("Numeric key \(key) pressed!")
    }
    
    /// This function is a part of the CustomNumericKeyboardDelegate interface
    /// and will be triggered when the backspace button is pressed on the custom keyboard.
    func numericBackspacePressed() {
        print("Backspace pressed!")
    }
    
    /// This function is a part of the CustomNumericKeyboardDelegate interface
    /// and will be triggered when the symobol buttons are pressed on the custom keyboard.
    func numericSymbolPressed(symbol: String) {
        print("Symbol \(symbol) pressed!")
    }
}
