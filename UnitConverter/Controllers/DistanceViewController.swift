//
//  DistanceViewController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import UIKit

class DistanceViewController: UIViewController, CustomKeyboardDelegate {
    @IBOutlet weak var viewScroller: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var mileTextField: UITextField!
    @IBOutlet weak var kilometerTextField: UITextField!
    @IBOutlet weak var meterTextField: UITextField!
    @IBOutlet weak var yardTextField: UITextField!
    @IBOutlet weak var inchTextField: UITextField!
    @IBOutlet weak var centimeterTextField: UITextField!
    @IBOutlet weak var millimeterTextField: UITextField!
    
    var textFeilds: [UITextField]? = nil
    var activeTextField = UITextField()
    var history = History().distance
    
    override func viewDidLoad() {
        textFeilds = [mileTextField, kilometerTextField, meterTextField, yardTextField,
                      inchTextField, centimeterTextField, millimeterTextField]
        
        // Hide keyboard if view is tapped
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        // Disable save button
        navigationItem.rightBarButtonItem!.isEnabled = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mileTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        mileTextField.setAsNumericKeyboard(delegate: self)
        
        kilometerTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        kilometerTextField.setAsNumericKeyboard(delegate: self)
        
        meterTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        meterTextField.setAsNumericKeyboard(delegate: self)
        
        yardTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        yardTextField.setAsNumericKeyboard(delegate: self)
        
        inchTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        inchTextField.setAsNumericKeyboard(delegate: self)
        
        centimeterTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        centimeterTextField.setAsNumericKeyboard(delegate: self)
        
        millimeterTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        millimeterTextField.setAsNumericKeyboard(delegate: self)
        
        // Observe keyboard show event to add prerequisits
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    /// Listen to taps on the view. Handle hiding the keyboard and resotre the view
    @objc func hideKeyboard() {
        view.endEditing(true)
        UIView.animate(withDuration: Defaults.ANIMATION_DURATION, animations: {
            self.stackViewTopConstraint.constant = ParentStack.TOP_PADDING
            self.view.layoutIfNeeded()
            
            // Reset the bottom alignment of scroll view
            var contentInset:UIEdgeInsets = self.viewScroller.contentInset
            contentInset.bottom = self.viewScroller.safeAreaInsets.bottom
            self.viewScroller.contentInset = contentInset
        })
    }
    
    /**
     Observer to detect the editing `TextField` to scroll the view to properly focus on the field
     - Parameter NSNotification: Registered object of data
     */
    @objc func keyboardWillShow(notification: NSNotification) {
        let firstResponder = getFirstResponder(inView: self.view)
        
        if firstResponder != nil {
            // Selected text field
            activeTextField = firstResponder as! UITextField;
            // Stack the text field belongs to
            let activeTextFieldSuperView = activeTextField.superview!
            
            if let info = notification.userInfo {
                let keyboard:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
                // Distance between bottom of active text field to top of the keyboard
                let targetY = view.frame.size.height - keyboard.height - ParentStack.TOP_PADDING -
                    activeTextField.frame.size.height
                let initialY = stackView.frame.origin.y + activeTextFieldSuperView.frame.origin.y +
                    activeTextField.frame.origin.y
                
                // Scroll the view down by diff amount to focus on the editing field
                let diff = targetY - initialY
                var offset = ParentStack.TOP_PADDING
                if (diff != 0 && diff < 0) {
                    offset += diff
                }
                self.view.layoutIfNeeded()
                UIView.animate(withDuration: Defaults.ANIMATION_DURATION, animations: {
                    self.stackViewTopConstraint.constant = offset
                    self.view.layoutIfNeeded()
                })
                
                var contentInset:UIEdgeInsets = self.viewScroller.contentInset
                contentInset.bottom = keyboard.size.height
                viewScroller.contentInset = contentInset
            }
        }
    }
    
    /**
     Update `TextFeilds` with converted values. Will be called while editing
     - Warning: The tags have been set in the storyboard to make the function generic.
     - Parameter textField: Value changed text field.
     */
    @IBAction func onTextFieldChange(_ textField: UITextField) {
        var unit: DistanceUnit?
        
        if textField.tag == 1 {
            unit = DistanceUnit.mile
        } else if textField.tag == 2 {
            unit = DistanceUnit.kilometer
        } else if textField.tag == 3 {
            unit = DistanceUnit.meter
        } else if textField.tag == 4 {
            unit = DistanceUnit.yard
        } else if textField.tag == 5 {
            unit = DistanceUnit.inch
        } else if textField.tag == 6 {
            unit = DistanceUnit.centimeter
        } else if textField.tag == 7 {
            unit = DistanceUnit.millimeter
        }
        updateTextFields(textField: textField, unit: unit!)
        
        // Disable save button if all the TextFields are empty
        if isTextFieldsEmpty(list: textFeilds!) {
            navigationItem.rightBarButtonItem!.isEnabled = false;
        } else {
            navigationItem.rightBarButtonItem!.isEnabled = true;
        }
    }
    
    /**
     Save of conversion on to the userdefaults. Only 5 conversions will be saved under each type.
     
     - Warning Can only save 5 conversions of each converter type
     - Warning Alert will be show if saving is succesful
     - Parameter sender: Navigation button item
     */
    @IBAction func onSaveClick(_ sender: UIBarButtonItem) {
        if !isTextFieldsEmpty(list: textFeilds!) {
            let conversion = """
                             mile = \(mileTextField.text!) kilometer = \(kilometerTextField.text!) \
                             meter = \(meterTextField.text!) yard =  \(yardTextField.text!) \
                             inch = \(inchTextField.text!) centimeter = \(centimeterTextField.text!) \
                             millimeter = \(millimeterTextField.text!)
                             """
            // Update distance's history from the new conversion value (algo: FIFO)
            if history.count > HistoryConst.MAX_SIZE {
                history = Array(history.suffix(HistoryConst.MAX_SIZE - 1))
            }
            history.append(conversion)
            History().distance = history
            
            // Alert user about the update
            let alert = UIAlertController(title: "Success",
                                          message: "The conversion is succesfully saved!!!",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /**
     Modifies all the respective `TextFields` with conversions of the changed text field
     
     - Parameter textField: Changed field
     - Parameter unit: `DistanceUnit` type of the changed field
     */
    func updateTextFields(textField: UITextField, unit: DistanceUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let distanceConverter = DistanceConverter(distance: Distance(unit: unit,
                                                                             value: input,
                                                                             decimalPlaces: 4))
                
                for _unit in DistanceUnit.allCases {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapToTextField(unit: _unit)
                    textField.text = distanceConverter.convert(to: _unit)
                }
            }
        }
    }
    
    /// Clear all the `TextFields`
    func clearTextFields() {
        mileTextField.text = ""
        kilometerTextField.text = ""
        meterTextField.text = ""
        yardTextField.text = ""
        inchTextField.text = ""
        centimeterTextField.text = ""
        millimeterTextField.text = ""
    }
    
    /**
     Map the `DistanceUnit` to the respective `UITextField`
     
     - Parameter unit: Distance unit type
     - Returns: Corresponding `UITextField`
     */
    func mapToTextField(unit: DistanceUnit) -> UITextField {
        var textField = meterTextField
        switch unit {
        case .mile:
            textField = mileTextField
        case .kilometer:
            textField = kilometerTextField
        case .meter:
            textField = meterTextField
        case .yard:
            textField = yardTextField
        case .inch:
            textField = inchTextField
        case .centimeter:
            textField = centimeterTextField
        case .millimeter:
            textField = millimeterTextField
        }
        return textField!
    }
    
    /// Overidden from `CustomNumericKeyboardDelegate` will be triggered when retract button is pressed
    func retractKeyPressed() {
        hideKeyboard()
    }
    
    /// Overidden from `CustomNumericKeyboardDelegate` will be triggered when numeric buttons are pressed
    func numericKeyPressed(key: Int) {
        print("Numeric key \(key) pressed!")
    }
    
    /// Overidden from `CustomNumericKeyboardDelegate` will be triggered when backspace button is pressed
    func numericBackspacePressed() {
        print("Backspace pressed!")
    }
    
    /// Overidden from `CustomNumericKeyboardDelegate` will be triggered when  symobol buttons are pressed
    func numericSymbolPressed(symbol: String) {
        print("Symbol \(symbol) pressed!")
    }
}
