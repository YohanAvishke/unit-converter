//
//  WeightViewController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-12.
//

import Foundation
import UIKit

class WeightViewController: UIViewController, CustomKeyboardDelegate {
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var viewScroller: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var kilogramTextField: UITextField!
    @IBOutlet weak var gramTextField: UITextField!
    @IBOutlet weak var ounceTextField: UITextField!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var spStoneTextField: UITextField!
    @IBOutlet weak var spPoundTextField: UITextField!
    
    var settingsMenu: UIMenu?
    var decimalPlaces: Int = 2
    var textFeilds: [UITextField]? = nil
    var activeTextField = UITextField()
    var history = History().weight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFeilds = [kilogramTextField, gramTextField, ounceTextField, poundTextField,
                      spStoneTextField, spPoundTextField]
        
        // Hide keyboard if view is tapped
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        // Disable save button
        navigationItem.rightBarButtonItem!.isEnabled = false;
        
        configureSettingsMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        kilogramTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        kilogramTextField.setAsNumericKeyboard(delegate: self)
        
        gramTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        gramTextField.setAsNumericKeyboard(delegate: self)
        
        ounceTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        ounceTextField.setAsNumericKeyboard(delegate: self)
        
        poundTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        poundTextField.setAsNumericKeyboard(delegate: self)
        
        spStoneTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        spStoneTextField.setAsNumericKeyboard(delegate: self)
        
        spPoundTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        spPoundTextField.setAsNumericKeyboard(delegate: self)
        
        // Disable events for the stone-pound text field
        spPoundTextField.isUserInteractionEnabled = false
        
        // Observe keyboard show event to add prerequisits
        NotificationCenter.default
            .addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                         name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    /**
     Listen to taps on the view. Handle hiding the keyboard and resotre the view
     */
    // TODO remove @objc
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
                             kilogram = \(kilogramTextField.text!) gram = \(gramTextField.text!) \
                             ounz = \(ounceTextField.text!) ponds =  \(poundTextField.text!) \
                             stones = \(spStoneTextField.text!)  & pounds = \(spPoundTextField.text!)
                             """
            // Update weight's history from the new conversion value (algo: FIFO)
            if history.count > HistoryConst.MAX_SIZE {
                history = Array(history.suffix(HistoryConst.MAX_SIZE - 1))
            }
            history.append(conversion)
            History().weight = history
            
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
     Configure and Add the menu to display the decimal places on settings button click
     */
    func configureSettingsMenu() {
        settingsMenu = UIMenu(
            title: "Decimal Places", image: nil, identifier: nil, options: [],
            children: [
                UIAction(title: "Two Places", image: UIImage(systemName: "2.circle"),
                         handler: { (_) in self.onSettingsChange(decimalPlaces: 2) }),
                UIAction(title: "Three Places", image: UIImage(systemName: "3.circle"),
                         handler: { (_) in self.onSettingsChange(decimalPlaces: 3) }),
                UIAction(title: "Four Places", image: UIImage(systemName: "4.circle"),
                         handler: { (_) in self.onSettingsChange(decimalPlaces: 4) })
            ]
        )
        settingsButton.menu = settingsMenu
    }
    
    /**
     When an menu item is selected update the `TextFields`
     */
    func onSettingsChange(decimalPlaces: Int) {
        self.decimalPlaces = decimalPlaces
        
        var activeValue: Double = Double(poundTextField.text!)!
        activeValue = activeValue.rounded(toPlaces: decimalPlaces)
        poundTextField.text = String(activeValue)
        
        updateTextFields(textField: poundTextField, unit: WeightUnit.pound)
    }
    
    /**
     Modifies all the respective `TextFields` with conversions of the changed text field
     
     - Parameter textField: Changed field
     - Parameter unit: `WeightUnit` type of the changed field
     */
    func updateTextFields(textField: UITextField, unit: WeightUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let weightConverter = WeightConverter(weight: Weight(unit: unit, value: input,
                                                                     decimalPlaces: self.decimalPlaces))
                
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
