//
//  VolumeViewController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import UIKit

class VolumeViewController: UIViewController, CustomKeyboardDelegate {
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var viewScroller: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var litreTextField: UITextField!
    @IBOutlet weak var millilitreTextField: UITextField!
    @IBOutlet weak var gallonTextField: UITextField!
    @IBOutlet weak var pintTextField: UITextField!
    @IBOutlet weak var fluidOunceTextField: UITextField!
    
    var settingsMenu: UIMenu?
    var decimalPlaces: Int = 2
    var textFeilds: [UITextField]? = nil
    var activeTextField = UITextField()
    var history = History().volume
    
    override func viewDidLoad() {
        textFeilds = [litreTextField, millilitreTextField, gallonTextField, pintTextField,
                      fluidOunceTextField]
        // Hide keyboard if view is tapped
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        // Disable save button
        navigationItem.rightBarButtonItem!.isEnabled = false;
        
        configureSettingsMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        litreTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        litreTextField.setAsNumericKeyboard(delegate: self)
        
        millilitreTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        millilitreTextField.setAsNumericKeyboard(delegate: self)
        
        gallonTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        gallonTextField.setAsNumericKeyboard(delegate: self)
        
        pintTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        pintTextField.setAsNumericKeyboard(delegate: self)
        
        fluidOunceTextField.setPaddingFor(left: UnitTextField.LEFT_TEXT_PADDING)
        fluidOunceTextField.setAsNumericKeyboard(delegate: self)
        
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
        var unit: VolumeUnit?
        
        if textField.tag == 1 {
            unit = VolumeUnit.litre
        } else if textField.tag == 2 {
            unit = VolumeUnit.millilitre
        } else if textField.tag == 3 {
            unit = VolumeUnit.gallon
        } else if textField.tag == 4 {
            unit = VolumeUnit.pint
        } else if textField.tag == 5 {
            unit = VolumeUnit.fluidOunce
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
                             litre = \(litreTextField.text!) \
                             millilitre = \(millilitreTextField.text!) \
                             gallon = \(gallonTextField.text!) pint =  \(pintTextField.text!) \
                             fluid ounce =  \(fluidOunceTextField.text!)
                             """
            // Update volume's history from the new conversion value (algo: FIFO)
            if history.count > HistoryConst.MAX_SIZE {
                history = Array(history.suffix(HistoryConst.MAX_SIZE - 1))
            }
            history.append(conversion)
            History().volume = history
            
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
        updateTextFields(textField: millilitreTextField, unit: VolumeUnit.millilitre)
    }
    
    /**
     Modifies all the respective `TextFields` with conversions of the changed text field
     
     - Parameter textField: Changed field
     - Parameter unit: `VolumeUnit` type of the changed field
     */
    func updateTextFields(textField: UITextField, unit: VolumeUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let volumeConverter = VolumeConverter(volume: Volume(unit: unit, value: input,
                                                                     decimalPlaces: decimalPlaces))
                
                for _unit in VolumeUnit.allCases {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapToTextField(unit: _unit)
                    textField.text = volumeConverter.convert(unit: _unit)
                }
            }
        }
    }
    
    /// Clear all the `TextFields`
    func clearTextFields() {
        litreTextField.text = ""
        millilitreTextField.text = ""
        gallonTextField.text = ""
        pintTextField.text = ""
        fluidOunceTextField.text = ""
    }
    
    /**
     Map the `VolumeUnit` to the respective `UITextField`
     
     - Parameter unit: Volume unit type
     - Returns: Corresponding `UITextField`
     */
    func mapToTextField(unit: VolumeUnit) -> UITextField {
        var textField = litreTextField
        switch unit {
        case .litre:
            textField = litreTextField
        case .millilitre:
            textField = millilitreTextField
        case .gallon:
            textField = gallonTextField
        case .pint:
            textField = pintTextField
        case .fluidOunce:
            textField = fluidOunceTextField
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
