//
//  CustomKeyboard.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-17.
//

import Foundation
import UIKit

// public constant which sets the recommended keyboard height
let customNKbRecommendedHeight = 274.00

// private constants to set button colours
private let defaultKeyColour = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.00)
private let pressedKeyColour = UIColor.red

@objc protocol CustomKeyboardDelegate {
    func numericKeyPressed(key: Int)
    func numericBackspacePressed()
    func numericSymbolPressed(symbol: String)
    func retractKeyPressed()
}

class CustomKeyboard: UIView {
    @IBOutlet weak var btnKey0: UIButton!
    @IBOutlet weak var btnKey1: UIButton!
    @IBOutlet weak var btnKey2: UIButton!
    @IBOutlet weak var btnKey3: UIButton!
    @IBOutlet weak var btnKey4: UIButton!
    @IBOutlet weak var btnKey5: UIButton!
    @IBOutlet weak var btnKey6: UIButton!
    @IBOutlet weak var btnKey7: UIButton!
    @IBOutlet weak var btnKey8: UIButton!
    @IBOutlet weak var btnKey9: UIButton!
    @IBOutlet weak var btnKeyMinus: UIButton!
    @IBOutlet weak var btnKeyPeriod: UIButton!
    @IBOutlet weak var btnKeyBackspace: UIButton!
    @IBOutlet weak var btnKeyRetract: UIButton!
    
    // All button outlets except the backspace button
    // This is used in changing the button appearance.
    var allButtons: [UIButton] {
        return [btnKey0, btnKey1, btnKey2, btnKey3, btnKey4, btnKey5, btnKey6, btnKey7, btnKey8, btnKey9,
                btnKeyPeriod, btnKeyMinus] }
    
    // This variable will be set as the view controller so that
    // the keyboard can send messages to the view controller.
    weak var delegate: CustomKeyboardDelegate?
    
    // appearance variables
    //    var btnDefaultBgColour = defaultKeyColour { didSet { updateButtonAppearance() } }
    var btnPressedBgColour = pressedKeyColour { didSet { updateButtonAppearance() } }
    //    var btnDefaultFontColor = UIColor.gray { didSet { updateButtonAppearance() } }
    var btnPressedFontColor = UIColor.white { didSet { updateButtonAppearance() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeKeyboard()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(enableMinusButton(notification:)),
                                               name: NSNotification.Name(rawValue: "enableMinusButton"),
                                               object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeKeyboard()
    }
    
    func initializeKeyboard() {
        let xibFileName = "CustomKeyboard"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        
        updateButtonAppearance()
        
        // disables minus button by default
        btnKeyMinus.isEnabled = false
    }
    
    // This function changes button appearance in different states.
    fileprivate func updateButtonAppearance() {
        for button in allButtons {
            button.setTitleColor(btnPressedFontColor, for: [.selected, .highlighted])
            if button.isSelected {
                button.backgroundColor = btnPressedBgColour
            }
        }
    }
    
    // This function can be used to programatically enable the minus button.
    @objc func enableMinusButton(notification: NSNotification) {
        btnKeyMinus.isUserInteractionEnabled = true
    }
    
    // This function handles numeric button click
    @IBAction func handleNumericButtonPress(_ sender: UIButton) {
        self.delegate?.numericKeyPressed(key: sender.tag)
    }
    
    // This function handles backspace button click
    @IBAction func handleBackspaceButtonPress(_ sender: AnyObject) {
        self.delegate?.numericBackspacePressed()
    }
    
    // This function handles symbol button click
    @IBAction func handleSymbolButtonPress(_ sender: UIButton) {
        if let symbol = sender.titleLabel?.text, symbol.count > 0 {
            self.delegate?.numericSymbolPressed(symbol: symbol)
        }
    }
    
    // This function handles retract keyboard button click
    @IBAction func handleRetractButtonPress(_ sender: Any) {
        self.delegate?.retractKeyPressed()
    }
}
