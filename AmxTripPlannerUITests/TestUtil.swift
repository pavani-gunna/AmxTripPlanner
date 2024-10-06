//
//  TestUtil.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 06/10/2024.
//

import XCTest

class TestUtil {

    static let UTIL = TestUtil()
    
    private init() {}
    
    
    func tapAndSetTextFieldValue(app: XCUIApplication, textFieldIdentifier: String, value: String){
        let textField = app.textFields[textFieldIdentifier]
        XCTAssertTrue(textField.exists, "TextField with identifier \(textFieldIdentifier) does not exist")
        textField.tap()
        if let existingValue = textField.value as? String, !existingValue.isEmpty {
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: existingValue.count)
            textField.typeText(deleteString)
        }
        textField.typeText(value)
    }
    
    func tapAndSetSecureTextField(app: XCUIApplication, secureTextFieldIdentifier: String, value: String) {
        let secureTextField = app.secureTextFields[secureTextFieldIdentifier]
        XCTAssertTrue(secureTextField.exists, "SecureTextField with identifier \(secureTextFieldIdentifier) does not exist")
        secureTextField.tap()
        if let existingValue = secureTextField.value as? String, !existingValue.isEmpty {
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: existingValue.count)
            secureTextField.typeText(deleteString)
        }
        secureTextField.typeText(value)
    }
    
    func tapButton(app: XCUIApplication, buttonIdentifier: String) {
        let button = app.buttons[buttonIdentifier]
        XCTAssertTrue(button.exists, "Button with identifier \(buttonIdentifier) does not exist")
        button.tap()
    }
    
}
