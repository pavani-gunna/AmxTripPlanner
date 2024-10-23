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
        assertTextField(textField: textField, textFieldIdentifier: textFieldIdentifier)
        textField.tap()
        if let existingValue = textField.value as? String, !existingValue.isEmpty {
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: existingValue.count)
            textField.typeText(deleteString)
        }
        textField.typeText(value)
    }
    
    func assertTextField(app: XCUIApplication, textFieldIdentifier: String){
        let textField = app.textFields[textFieldIdentifier]
        assertTextField(textField: textField, textFieldIdentifier: textFieldIdentifier)
    }
    
    func assertTextField(textField: XCUIElement, textFieldIdentifier: String){
        XCTAssertTrue(textField.exists, "TextField with identifier \(textFieldIdentifier) does not exist")
    }
    
    func tapAndSetSecureTextField(app: XCUIApplication, secureTextFieldIdentifier: String, value: String) {
        let secureTextField = app.secureTextFields[secureTextFieldIdentifier]
        assertSecureTextField(secureTextField: secureTextField, secureTextFieldIdentifier: secureTextFieldIdentifier)
        secureTextField.tap()
        if let existingValue = secureTextField.value as? String, !existingValue.isEmpty {
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: existingValue.count)
            secureTextField.typeText(deleteString)
        }
        secureTextField.typeText(value)
    }
    
    func assertSecureTextField(app: XCUIApplication, secureTextFieldIdentifier: String) {
        let secureTextField = app.secureTextFields[secureTextFieldIdentifier]
        assertSecureTextField(secureTextField: secureTextField, secureTextFieldIdentifier: secureTextFieldIdentifier)
    }
    
    func assertSecureTextField(secureTextField: XCUIElement, secureTextFieldIdentifier: String) {
        XCTAssertTrue(secureTextField.exists, "SecureTextField with identifier \(secureTextFieldIdentifier) does not exist")
    }
    
    
    func tapButton(app: XCUIApplication, buttonIdentifier: String) {
        let button = app.buttons[buttonIdentifier]
        assertButton(button: button, buttonIdentifier: buttonIdentifier)
        button.tap()
    }
    
    func assertButton(app: XCUIApplication, buttonIdentifier: String) {
        let button = app.buttons[buttonIdentifier]
        assertButton(button: button, buttonIdentifier: buttonIdentifier)
    }
    
    func assertButton(button: XCUIElement, buttonIdentifier: String) {
        XCTAssertTrue(button.exists, "Button with identifier \(buttonIdentifier) does not exist")
    }
    
    
    func anExpectation(element: XCUIElement, errorMessage: String) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        // Create an expectation for the predicate to be fulfilled within 5 seconds
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
        
        // Wait for the expectation to be fulfilled
        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
        
        // Check if the expectation was met
        XCTAssertEqual(result, .completed, errorMessage)
    }
    
    func loginIfNeeded(app: XCUIApplication) {
        let loginButton = app.buttons[TestData.LoginElementIDs.signinButton]
        
        // Check if we're already logged in by verifying the presence of an element on the logged-in screen
        if loginButton.exists {
            tapAndSetTextFieldValue(app: app,
                                    textFieldIdentifier: TestData.LoginElementIDs.usernameTextField,
                                    value: TestData.validMockData.username)
            tapAndSetSecureTextField(app: app,
                                     secureTextFieldIdentifier:  TestData.LoginElementIDs.passwordSecureField,
                                     value: TestData.validMockData.password)
            tapButton(app: app,
                      buttonIdentifier: TestData.LoginElementIDs.signinButton)
        }
    }
    
}
