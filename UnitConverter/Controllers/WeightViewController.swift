//
//  WeightViewController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-12.
//

import UIKit

class WeightViewController: UIViewController, CustomNumericKeyboardDelegate {
    @IBOutlet weak var viewScroller: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var kilogramTextField: UITextField!
    @IBOutlet weak var gramTextField: UITextField!
    @IBOutlet weak var ounceTextField: UITextField!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var spStoneTextField: UITextField!
    @IBOutlet weak var spPoundTextField: UITextField!
    
    var textFeilds: [UITextField]? = nil
    var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFeilds = [kilogramTextField, gramTextField, ounceTextField, poundTextField,
                      spStoneTextField, spPoundTextField]
        
        // Hide keyboard if view is tapped
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        // Disable save button
        navigationItem.rightBarButtonItem!.isEnabled = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Attach the custom keyboard
        kilogramTextField.setAsNumericKeyboard(delegate: self)
        gramTextField.setAsNumericKeyboard(delegate: self)
        ounceTextField.setAsNumericKeyboard(delegate: self)
        poundTextField.setAsNumericKeyboard(delegate: self)
        spStoneTextField.setAsNumericKeyboard(delegate: self)
        spPoundTextField.setAsNumericKeyboard(delegate: self)
        // Disable events for the stone-pound text field
        spPoundTextField.isUserInteractionEnabled = false
        // Observe keyboard show event to add prerequisits
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
    }
    
    /**
     Listen to taps on the view. Handle hiding the keyboard and resotre the view
     */
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
            var activeTextFieldSuperView = activeTextField.superview!
            // If stone or stone-pounds are edited
            if activeTextField.tag == 5 || activeTextField.tag == 6 {
                activeTextFieldSuperView = activeTextField.superview!.superview!
            }
            
            if let info = notification.userInfo {
                let keyboard:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
                // Distance between bottom of active text field to top of the keyboard
                let targetY = view.frame.size.height - keyboard.height - ParentStack.TOP_PADDING -
                    activeTextField.frame.size.height
                let initialY = stackView.frame.origin.y + activeTextFieldSuperView.frame.origin.y + activeTextField.frame.origin.y
                
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
        var unit: WeightUnit?
        
        if textField.tag == 1 {
            unit = .kilogram
        } else if textField.tag == 2 {
            unit = .gram
        } else if textField.tag == 3 {
            unit = .ounce
        } else if textField.tag == 4 {
            unit = .pound
        } else if textField.tag == 5 {
            unit = .stone
        }
        updateTextFields(textField: textField, of: unit!)
        
        // Disable save button if all the TextFields are empty
        if isTextFieldsEmpty(list: textFeilds!) {
            navigationItem.rightBarButtonItem!.isEnabled = false;
        } else {
            navigationItem.rightBarButtonItem!.isEnabled = true;
        }
    }
    
    /**
     Modifies all the respective `TextFields` with conversions of the changed text field
     
     - Parameter textField: Changed field
     - Parameter unit: `WeightUnit` type of the changed field
     */
    func updateTextFields(textField: UITextField, of unit: WeightUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let weightConverter = WeightConverter(weight: Weight(unit: unit, value: input,
                                                                     decimalPlaces: 4))
                
                for _unit in WeightUnit.allCases {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapToTextField(unit: _unit)
                    textField.text = weightConverter.convert(to: _unit)
                    moderateStonePounds(weight: weightConverter.weight)
                }
            }
        }
    }
    
    /// This function handles the saving of conversions on to the userdefaults.
    /// Only 5 conversions will be saved under each type.
    /// It checks if the text fields are filled and saves the conversion in user
    /// defaults and if the text fields aren't empty an alert will be shown.
    ///
    /// - Parameter sender: The navigation button item.
    @IBAction func handleSaveButtonClick(_ sender: UIBarButtonItem) {
        if !isTextFieldsEmpty(list: textFeilds!) {
            let conversion = "\(kilogramTextField.text!) kg = \(gramTextField.text!) g = \(ounceTextField.text!) oz =  \(poundTextField.text!) lb = \(spStoneTextField.text!) stones & \(spPoundTextField.text!) pounds"
            
            var arr = UserDefaults.standard.array(forKey: HistoryConst.WEIGHT_KEY) as? [String] ?? []
            
            if arr.count >= HistoryConst.MAX_SIZE {
                arr = Array(arr.suffix(HistoryConst.MAX_SIZE - 1))
            }
            arr.append(conversion)
            UserDefaults.standard.set(arr, forKey: HistoryConst.WEIGHT_KEY)
            
            let alert = UIAlertController(title: "Success", message: "The weight conversion was successully saved!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "You are trying to save an empty conversion!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /// Clear all the `TextFields`
    func clearTextFields() {
        kilogramTextField.text = ""
        gramTextField.text = ""
        ounceTextField.text = ""
        poundTextField.text = ""
        spStoneTextField.text = ""
        spPoundTextField.text = ""
    }
    
    /**
     Map the `WeightUnit` to the respective `UITextField`
     
     - Parameter unit: Weight unit type
     - Returns: Corresponding `UITextField`
     */
    func mapToTextField(unit: WeightUnit) -> UITextField {
        var textField = kilogramTextField
        switch unit {
        case .kilogram:
            textField = kilogramTextField
        case .gram:
            textField = gramTextField
        case .ounce:
            textField = ounceTextField
        case .pound:
            textField = poundTextField
        case .stone:
            textField = spStoneTextField
        }
        return textField!
    }
    
    /**
     Seperate out the decimal portion of the stone field and convert and add it to pound field
     */
    func moderateStonePounds(weight: Weight) {
        if let textFieldVal = spStoneTextField.text {
            if let value = Double(textFieldVal as String) {
                let stones = Int(value)
                spStoneTextField.text = String(stones)
                // Set pounds if pound value == 0.0 then clear the field
                let deciamlPart = value.truncatingRemainder(dividingBy: 1)
                if deciamlPart > 0 {
                    let pounds = deciamlPart * 14
                    spPoundTextField.text = String(pounds.rounded(toPlaces: weight.decimalPlaces))
                } else {
                    spPoundTextField.text = ""
                }
            }
        }
    }
    
    /// This function is a part of the CustomNumericKeyboardDelegate interface
    /// and will be triggered when the retract button is pressed on the custom keyboard.
    func retractKeyPressed() {
        //        keyboardWillHide()
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

extension Float
{
    var cleanValue: String
    {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
